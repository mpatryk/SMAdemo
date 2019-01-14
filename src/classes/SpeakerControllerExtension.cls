/**
 * Created by miler_8zu3w9c on 7/13/2017.
 */
public with sharing class SpeakerControllerExtension {
	private final Speaker__c speaker;

	public Blob picture {get;set;}
	public String errorMessage {get;set;}

	private ApexPages.StandardController standardController;

	public SpeakerControllerExtension(ApexPages.StandardController standardController){
		this.speaker = (Speaker__c) standardController.getRecord();
		this.standardController = standardController;
	}

	public PageReference save(){
		errorMessage = '';
		try{
			upsert speaker;
			if(picture != null){
				Attachment attachment = new Attachment();
				attachment.Body = picture;
				attachment.Name = 'speaker_' + speaker.Id + '.jpg';
				attachment.ParentId = speaker.Id;
				attachment.ContentType = 'application/jpg';
				insert attachment;
				speaker.Picture_Path__C = '/servlet/servlet.FileDownload?file=' + attachment.Id;
				update  speaker;
			}
			return new ApexPages.StandardController(speaker).view();
		}catch (System.Exception ex){
			errorMessage = ex.getMessage();
			return null;
		}
	}


}