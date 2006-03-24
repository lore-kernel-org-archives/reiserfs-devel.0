From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: lost partition table
Date: Fri, 24 Mar 2006 17:45:12 +0300
Message-ID: <1143211512.6173.119.camel@tribesman.namesys.com>
References: <1142439481.27675.ezmlm@namesys.com>
	 <20060324135549.GB13979@raven.londonmet.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28336-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060324135549.GB13979@raven.londonmet.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ild0012@raven.londonmet.ac.uk
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2006-03-24 at 13:55 +0000, ild0012@raven.londonmet.ac.uk wrote:
> Hello folks.
> 
> i am using slackware linux(2.6.14 with reiser4 patch) on x86_64 and was trying to install free_bsd on a separate partition.
> well, during that instalation , accedentualy i have pressed a wrong key , so my partition table is owerriten by something else , but i realized this streight away and stopped the instalation process .
> 
> so in fac rigth now i ve got around 200GiB of data , all mushed up . there were 11 linux partitions without raid.
> many of thoes were reiserfs and reiser4.
> 
> i have found on some linux distro's mailing list that the boot sector's backup made by the LILO should contain the table . i'm not 100% sure of that , but i believe it must do .
> 
> so basicaly i have this backup file, but it exists somewhere in betweent all that mess on my drive .
> 
> now the question is how to recover that file ?
> 
> obviously i have tried gpart , wich was updated last time back in 1999 , so could find only my swap part'ion :)
> 

You might want to try newer gpart

> i also read about magicrescue  on this list's archive ..but the file i need seems to be binary and i'm still not sure dies it contain the table or just the LILO code .
> 
> Can anybody help please , because i think that this 99.(9)% recoveriable !
> .
> thank you anyway.!
> 
> 

