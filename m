From: Toby Thain <toby@smartgames.ca>
Subject: Re: lost partition table
Date: Fri, 24 Mar 2006 10:59:45 -0500
Message-ID: <98A71BF6-55C7-4C22-9218-C73A2301FBA5@smartgames.ca>
References: <1142439481.27675.ezmlm@namesys.com> <20060324135549.GB13979@raven.londonmet.ac.uk>
Mime-Version: 1.0 (Apple Message framework v746.3)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28338-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060324135549.GB13979@raven.londonmet.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: ild0012@raven.londonmet.ac.uk
Cc: reiserfs-list@namesys.com


On 24-Mar-06, at 8:55 AM, ild0012@raven.londonmet.ac.uk wrote:

>
> Hello folks.
>
> i am using slackware linux(2.6.14 with reiser4 patch) on x86_64 and  
> was trying to install free_bsd on a separate partition.
> well, during that instalation , accedentualy i have pressed a wrong  
> key , so my partition table is owerriten by something else , but i  
> realized this streight away and stopped the instalation process .
>
> so in fac rigth now i ve got around 200GiB of data , all mushed  
> up . there were 11 linux partitions without raid.
> many of thoes were reiserfs and reiser4.


I have located Reiser3 partitions after overwriting a partition  
table. I imagine Reiser4 would be similar.

The method I used is described here: http://slashdot.org/~toby/ 
journal/110587

Once you have starting sector locations, you can write a new  
partition table.

Tedious but it will work.

--Toby


>
> i have found on some linux distro's mailing list that the boot  
> sector's backup made by the LILO should contain the table . i'm not  
> 100% sure of that , but i believe it must do .
>
> so basicaly i have this backup file, but it exists somewhere in  
> betweent all that mess on my drive .
>
> now the question is how to recover that file ?
>
> obviously i have tried gpart , wich was updated last time back in  
> 1999 , so could find only my swap part'ion :)
>
> i also read about magicrescue  on this list's archive ..but the  
> file i need seems to be binary and i'm still not sure dies it  
> contain the table or just the LILO code .
>
> Can anybody help please , because i think that this 99.(9)%  
> recoveriable !
> .
> thank you anyway.!
>

