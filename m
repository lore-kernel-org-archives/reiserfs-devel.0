From: evilninja <evilninja@gmx.net>
Subject: Re: changing label of disk
Date: Wed, 31 Aug 2005 20:15:04 +0200
Message-ID: <4315F3A8.4060605@gmx.net>
References: <e692861c0508292136543a02e1@mail.gmail.com>	 <1125380557.9589.3.camel@gentoo> <4313FE21.8080709@namesys.com>	 <019d01c5ad68$4d5fdfa0$d60310ac@homedom> <43147EFE.2020804@perkel.com>	 <43150100.40304@namesys.com> <4315D455.1050100@suse.com> <f18a8d9805083110322ecca20@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25762-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <f18a8d9805083110322ecca20@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bedros Hanounik <2bedros@gmail.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Bedros Hanounik schrieb:
> 
> mkfs.reiserfs -l label will overwrite the old data; is there a way to edit 
> the old lable w/o reformating the disk, other than hexedit the disk?

reiserfstune -l LABEL

should do the job.

(and xfs_admin for XFS, jfs_tune for JFS ;)

-- 
BOFH excuse #219:

Recursivity.  Call back if it happens again.
