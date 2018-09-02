Installing ngroks:
	Used to create public ip of your local web server.
	Go to https://ngrok.com/download and follow the steps to to install ngrok
	Expose your jenkins localhost using the command './ngrok http 8080'.This helps in github and jenkins communication.(Here port 8080 is used because my jenkins is being hosted in that port).
	Then you will get a public url of https://<something>.ngrok.io 
	
Installing BlueOcean:
	Go to Manage Jenkins then to Manage Plugins
	Choose the Available tab underand search for blue ocean in search bar.
	Add the Blue Ocean (BlueOcean Aggregator) plugin.All other Blue Ocean plugins will be installed automatically as dependencies.
	Blue Ocean will be activated when Jenkins restarts.
	Choose the Open Blue Ocean option from the left menu.


Creating a Private Reposritory in Github:
	Go to https://github.com/ and login into your account using your login credentials
	Then you get to see a '+' symbol on top right coner of the page.go on press it.Select new reposritory for the drop down menu.
	Fills the details of the reposritory and make it as private repo by selectin as private.
	If there is no option to make repo as private then go to 'https://help.github.com/articles/applying-for-a-student-developer-pack/' and follow the instructions.

Adding private GitHub Repository as a FreeStyle project:
	In Jenkins dashboard menu select new item.Enter the Poject name and	 select free style project and click ok.
	Go to Source Code Management and select Git.
	Add Private Repo URl.
	Since the repository is private Jenkins will not be able to access the repo without credentials. Click on Add button next to Credential input box.
	Choose Jenkins as the Credential Provider in the dropdown menu. A popup should appear asking for the details.
	Choose Username with Password under the Kind option. Enter GitHub username and password under their respective text boxes.
	After adding your credentials choose the newly added credentials in the dropdown menu that appears next to Credentials label.
	Click Apply.

Configure the Git SCM Poll build trigger:
	Under Build Triggers section in configuration.choose GitHub hook trigger for GITScm polling.
	Adding Jenkins service to GitHub:
		We need to set up our GitHub repo to make a request to Jenkins webhook(Whenever a commit is made on the Github repo)so that the polling logic can be applied.
		Go to your github priavte repo.
		Select setting options  from the list displayed on top
		Choose Integration and services from the submenu and click on Add service.search for Jenkins(GIT Plugin)  
		Enter the Jenkins Url with extension '/github-webhook/'(https://<some_Id>.ngrok.io/github-webhook/)
		Under SSl verification select Disable.
		Under Which events would you like to trigger this webhook? selsct send me push event.
		Under Which events would you like to trigger this webhook? select just push even 
		Check Active option to activate the services.
		Click Add service		

Post Build Actions - Email Notification
	Steps to setup Email Notifications as a post build action have been documented below. Email Notifications allow us to send customized email notifications after the build process.
	Configuring Email:
		We need to first add the details of the SMTP server and the mail account so that Jenkins can send the mail.
		Go to Manage Jenkins and select Configure Systems and scroll down to the E-mail Notification section.
		Add the SMTP server details e.g. smtp.gmail.com for a Gmail account.
		Click on the Advanced button to configure the mail account that will be used to send the mails.
		Select Use SMTP Authentication if required e.g. Gmail uses a password for authentication and so this must be selected.
		Enter the account username under User Name and password under Password.
		Select Use SSL and specify the SMTP port (465 mostly).
		With this the basic email configuration is complete.
	Adding the post build action:
		Go to Configuration page of project and scroll down to Post-build Actions.
		Click on Add post-build action and choose Email Notification from the dropdown menu.
		These options can be used for project based customizations of the email notification.
		With this the Post build action for extended email notification is complete.







