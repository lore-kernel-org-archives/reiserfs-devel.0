From: Anders Widman <andewid@tnonline.net>
Subject: Re: reiserfs and nfs.
Date: Tue, 26 Nov 2002 19:55:23 +0100
Message-ID: <18125752703.20021126195523@tnonline.net>
References: <E18Gjo0-0003pm-00@aqualene.uio.no>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12048-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <E18Gjo0-0003pm-00@aqualene.uio.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs-List@namesys.com


> [Nikita Danilov]
>> [lkml trimmed from CC list.]
>> Terje Malmedal writes:
>>> 
>>> [Nikita Danilov]
>>> > Terje Malmedal writes:
>>> >> 
>>> >> [Nikita Danilov]
>>> >> > Terje Malmedal writes:
>>> >> >> 
>>> 
>>> > [...]
>>> 
>>> >> 
>>> >> To reproduce do something like: 
>>> >> $ ls -li RMAIL
>>> >> 387607 -rw-------    1 tm       4050     36635726 Nov 20 16:15 RMAIL
>>> 
>>> > Is RMAIL inode number constant on the server?
>>> 
>>> No, it is always the same as the number seen over NFS, but I've not
>>> seen this problem when I've tried running emacs on the nfs-server
>>> itself.

>> I see following possibilities:

>> 1. some weird mail locking protocol (is RMAIL your mail spool file?)

> No, emacs gets the mail via POP3 and saves it in that file.

> This also happens with normal files being edited in emacs. 

>> 2. some EMACS/Rmail feature. Are you running identical Emacs
>> configurations on the client and server?

> Yes, both are RedHat 7.3 standard emacs, also this did not happen when
> the nfs-server was a solaris-box.



I  had  problems with NFS under Redhat 7.2 and 7.3. It works fine with
8.0 and other distributions such as LFS and Mandrake 9.

- Anders

