From: Hans Reiser <reiser@namesys.com>
Subject: Re: file attributes destroyed.
Date: Sun, 26 Oct 2003 15:06:53 +0300
Message-ID: <3F9BB8DD.5040800@namesys.com>
References: <200310261227.18711.wolfgang@rohdewald.de> <200310261550.06162.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15883-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200310261550.06162.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: wolfgang@rohdewald.de, reiserfs-list@namesys.com

Vitaly Fertman wrote:

>On Sunday 26 October 2003 14:27, Wolfgang Rohdewald wrote:
>  
>
>>Hi,
>>
>>last night, some files and directories involved in starting bash went
>>defect:
>>
>>$HOME had very wrong permissions
>>/etc/bashrc was empty
>>
>>and a few more. I did not make notes, I was rather trying to fix that ASAP.
>>
>>This never happened before. I am running an up to date debian unstable
>>with only ReiserFS and 2.4.22
>>
>>Last night, the summer daylight saving ended. The modification time of
>>/etc/bashrc was 03:29, I believe.
>>
>>Any ideas?
>>    
>>
>
>would you take the latest reiserfsprogs from our ftp site (3.6.11) and run
>reiserfsck to be sure that there are no fs corruptions.
>
>  
>
Are you using the SuSE kernel?  Are you using NFS?

-- 
Hans


