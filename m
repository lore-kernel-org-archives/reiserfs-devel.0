From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 4 Aug 2004 13:28:39 +0300
Message-ID: <20040804102839.GN1284@nysv.org>
References: <200406150022.34578.vitaly@namesys.com> <55083.202.71.232.79.1091590413.squirrel@sml.dyndns.org> <4110A1FA.2030803@namesys.com> <200408041416.17554.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19969-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408041416.17554.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, Thomas Graham <lkthomas@sml.dyndns.org>, reiserfs-list@namesys.com

On Wed, Aug 04, 2004 at 02:16:17PM +0400, Vitaly Fertman wrote:

>these blocks could be allocated for the reiser4 storage tree or user data. 
>now they are backup super blocks. if run fsck --build-fs, it recovers the 
>backup data in these blocks currently, so the previousely stored tree data 
>will be lost.

Would it not be possible to backup the content of these blocks and
attach them (or the content) somewhere else without data loss?

>it was discussed many times already, and I mentioned about it in dev 
>list many times also, e.g. the last email about it was 'format change in 
>the backup layout' from 28/07/04. Btw, You agreed with this backup
>layout scheem in the 'Reiser4 on-disk format' discussion more then a 
>month ago.

Were it possible to have the reiserfs-dev list archived on the web, or
read-only subscription access or something?

It'd be nice to have an early warning about these things....

-- 
mjt

