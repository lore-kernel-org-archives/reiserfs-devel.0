From: Hans Reiser <reiser@namesys.com>
Subject: Re: EACCESS vs ENOENT for nonexistent files-within-files
Date: Wed, 15 Sep 2004 15:40:02 -0700
Message-ID: <4148C4C2.7070906@namesys.com>
References: <20040915151803.vl9es48kkosg4k88@www.wagland.net> <16712.21927.550122.367489@thebsh.namesys.com> <41486A99.7050204@poelzi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21796-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41486A99.7050204@poelzi.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "daniel.poelzleithner" <poelzi@poelzi.org>
Cc: Nikita Danilov <nikita@clusterfs.com>, Paul Wagland <paul@kungfoocoder.org>, evilninja <evilninja@gmx.net>, reiserfs-list@namesys.com

daniel.poelzleithner wrote:

> Nikita Danilov wrote:
>
> |  > attributes? Even if the file is world readable? Does this really
> make sense?
> |
> | To make things clear: I have described in my message how things actually
> | do work in reiser4, so I don't see the point of your questions. If you
> | think reiser4 semantics is wrong (I am not happy with it too, by the
> | way), propose to Namesys something better.
>
> I would suggest to allow lookups when the user can read the file. The x
> bit should remain for exec on file objects, because console would be
> pain when every file must have a exec bits to access meta data.
> When the user can read a file, i don't think that the meta data can be
> security risk, he has already access to the file.
> And therefor not write access to file/metas without +w.
>
> No, its not perfect, but i think more unix like than +x for lookups on
> files.]

I like this for access to the builtin metafiles (whose permissions 
should normally be determined not individually but pased on the plugin 
and its permissions, but what about files within file-directories?  For 
them I think we need to allow sys_reiser4 to change the bits 
independently, and for apps that don't know how to distinguish the 2 
bits, oh well, change one change the other.

What are your thoughts?

>
> regards
> ~ Daniel

