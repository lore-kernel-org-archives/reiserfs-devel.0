From: Ralph Ulrich <eulenreich@gmx.de>
Subject: Re: The...  reiser4 with no ambiguity
Date: Tue, 16 Dec 2008 01:59:01 +0100
Message-ID: <gi6uhv$akc$1@ger.gmane.org>
References: <494035ED.4000706@gmx.de> <49404165.6050806@gmail.com> <49405D98.7000402@gmx.de> <4941467B.30308@gmail.com> <49414FC3.1040206@gmx.de> <494157FD.5020708@gmail.com> <ghroan$2e2$1@ger.gmane.org> <49419A90.4020906@gmail.com> <ghu32e$nqp$1@ger.gmane.org> <49440D64.9050900@gmail.com> <gi38gg$56v$1@ger.gmane.org> <49455BB0.7000300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

Edward Shishkin Sunday 14 December 2008 20:17:
>>  I know you stress this quiet often in your mails. Or is it just your
>>  focussing for now to get reiser4 mainline?
>> Is it not possible to introduce new extended features in reiser4 and
>> hide these features vfs?
> Yes, it is possible, but, again, those features should implement
> some new (optimal, efficient, safe, reliable, etc.) form of data
> storage.

I have the idea to rewrite reiser4 code to another
language (probably D: has clean syntax, has classes and 
garbage collection) and then to have a demon system in
user space where I can experiment to implement 
sql - database features. My aim is a winfs (Microsoft)
like system where you have both a filesystem api 
and a full featured database.

Could reiser4 fit well to my purpose ?

As of now all plugin types have to be "hard-formatted" 
on the partition. You cannot introduce
new plugins to an existing filesystem, yes? 

The first part of my work would be to enable a special place 
on disk for definitions of used plugins.
 
> Yes, I have pushed some technical concepts of r5 to r4 a year ago..

Here in this mailinglist?

Ralph


