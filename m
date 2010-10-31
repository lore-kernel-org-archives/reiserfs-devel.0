From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Bug with KDE 4.5 and reiser4 2.6.34
Date: Sun, 31 Oct 2010 14:41:51 +0100
Message-ID: <4CCD721F.3010908@gmail.com>
References: <201010310406.07767.volkerarmin@googlemail.com> <201010311243.28448.volkerarmin@googlemail.com> <4CCD5B1C.8070900@gmail.com> <201010311408.34589.volkerarmin@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=6TWSIgcciFM4H9MqiGq4/XjzAWzWEt6nGevUDg6oCI4=;
        b=JNag1dm0X2pJ0uNbBjE7U3y0qaBTg1pCBUCz1k+fxmRnINeKcIwAB27uu6L/jwyVco
         ygj6bRAVBl3n6SOM/AavBlUWgKRXxCZhpMcrCRVuA1zEEgjwDJVeOyIpSDLq0DqTGRz/
         iRTsv47NDK42BIXF8M7EgLzR/buFWCIxayI2o=
In-Reply-To: <201010311408.34589.volkerarmin@googlemail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Volker Armin Hemmann <volkerarmin@googlemail.com>
Cc: reiserfs-devel@vger.kernel.org

Volker Armin Hemmann wrote:
> On Sunday 31 October 2010, you wrote:
>
>   
>> could you provide fsck output?
>>     
>
> sure, here it is:
>
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
>
> Fscking the /dev/sda1 block device. 
> Will check the consistency of the Reiser4 SuperBlock. 
> Will build the Reiser4 FileSystem. 
> Continue? 
> (Yes/No): Y
> ***** fsck.reiser4 started at Sun Oct 31 13:42:25 2010
> Reiser4 fs was detected on /dev/sda1. 
> Master super block (16): 
> magic:          ReIsEr4 
> blksize:        4096 
> format:         0x0 (format40) 
> uuid:           9d3a5406-15b9-4a95-95e3-256d1571408d 
> label:          <none> 
>  
> Format super block (17): 
> plugin:         format40 
> description:    Disk-format plugin. 
> version:        0 
> magic:          ReIsEr40FoRmAt 
> mkfs id:        0x154b6487 
> flushes:        0 
> blocks:         15630416 
> free blocks:    4275401 
> root block:     7434018 
> tail policy:    0x2 (smart) 
> next oid:       0xd30db 
> file count:     712485 
> tree height:    5 
> key policy:     LARGE 
>  
>  
> CHECKING THE STORAGE TREE 
>         Read nodes 3162120 
>         Nodes left in the tree 3162120 
>                 Leaves of them 3125028, Twigs of them 36573 
>         Time interval: Sun Oct 31 13:42:25 2010 - Sun Oct 31 13:43:39 2010 
> CHECKING EXTENT REGIONS. 
>         Read twigs 36573 
>         Time interval: Sun Oct 31 13:43:39 2010 - Sun Oct 31 13:44:01 2010 
> LOOKING FOR UNCONNECTED NODES 
>         Read nodes 0 
>         Good nodes 0 
>                 Leaves of them 0, Twigs of them 0 
>         Time interval: Sun Oct 31 13:44:02 2010 - Sun Oct 31 13:44:02 2010 
> CHECKING EXTENT REGIONS. 
>         Read twigs 0 
>         Time interval: Sun Oct 31 13:44:02 2010 - Sun Oct 31 13:44:02 2010 
> INSERTING UNCONNECTED NODES 
>         Twigs: read 0, inserted 0, by item 0, empty 0 
>         Leaves: read 0, inserted 0, by item 0 
>         Time interval: Sun Oct 31 13:44:02 2010 - Sun Oct 31 13:44:02 2010 
> CHECKING THE SEMANTIC TREE 
>         Found 712485 objects. 
>         Lost&found 8 objects. 
>         Time interval: Sun Oct 31 13:44:02 2010 - Sun Oct 31 13:53:58 2010 
> CLEANING UP THE STORAGE TREE 
>
>   

Ah,
it was you, who didn't provide me access
to investigate unexpected fsck aborts?...

Edward.
