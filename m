From: Joachim Zobel <nc-zobeljo@netcologne.de>
Subject: Re: Will Reisefs have "undo"?
Date: 15 Jun 2003 11:50:16 +0200
Message-ID: <1055670615.671.106.camel@localhost>
References: <1055615895.698.129.camel@localhost>
	 <000d01c332ac$a94e23a0$0200a8c0@xpstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14549-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000d01c332ac$a94e23a0$0200a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS ML <reiserfs-list@namesys.com>

Am Sam, 2003-06-14 um 21.39 schrieb Fred -- Speed Up --:
> This is not the filesystem's work, KDE for instance has a trashcan, and you
> can bind the rm command to a special mv one that moves files from the
> initial place to a backup folder, the files of which you can empty regulary
> with a cron script depending on the file's "age". It's simple to implement,
> and really not something Reiser4 should be capable of ... instead
> journalising works very well to protect data from being erased, that's the
> only purpose of a modern filesystem.

A filesystem undo is most needed on servers. There usually is no KDE.
However a trash can can be done with hard links and a cronjob. What I
would like to have is more - I think I was not clear enough about that.
I not only want to undo deletions. I would like to be able to undo all
file system operations. 

VMS has a versioning file system, which does about what I want. It feels
pretty good if you can undo "everything I did since 11:30".

Joachim

-- 
"... ein Geschlecht erfinderischer Zwerge, die fuer alles gemietet werden 
koennen."                            - Bertolt Brecht - Leben des Galilei 

