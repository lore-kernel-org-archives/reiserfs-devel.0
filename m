From: Terje Malmedal <terje.malmedal@usit.uio.no>
Subject: Re: reiserfs and nfs.
Date: Tue, 26 Nov 2002 18:47:28 +0100
Message-ID: <E18Gjo0-0003pm-00@aqualene.uio.no>
References: <15843.22257.733637.646758@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12047-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <15843.22257.733637.646758@laputa.namesys.com> (message from
	Nikita Danilov on Tue, 26 Nov 2002 14:11:45 +0300)
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita@Namesys.COM
Cc: Reiserfs-List@Namesys.COM


[Nikita Danilov]
> [lkml trimmed from CC list.]
> Terje Malmedal writes:
>> 
>> [Nikita Danilov]
>> > Terje Malmedal writes:
>> >> 
>> >> [Nikita Danilov]
>> >> > Terje Malmedal writes:
>> >> >> 
>> 
>> > [...]
>> 
>> >> 
>> >> To reproduce do something like: 
>> >> $ ls -li RMAIL
>> >> 387607 -rw-------    1 tm       4050     36635726 Nov 20 16:15 RMAIL
>> 
>> > Is RMAIL inode number constant on the server?
>> 
>> No, it is always the same as the number seen over NFS, but I've not
>> seen this problem when I've tried running emacs on the nfs-server
>> itself.

> I see following possibilities:

> 1. some weird mail locking protocol (is RMAIL your mail spool file?)

No, emacs gets the mail via POP3 and saves it in that file.

This also happens with normal files being edited in emacs. 

> 2. some EMACS/Rmail feature. Are you running identical Emacs
> configurations on the client and server?

Yes, both are RedHat 7.3 standard emacs, also this did not happen when
the nfs-server was a solaris-box.

-- 
 - Terje
malmedal@usit.uio.no
