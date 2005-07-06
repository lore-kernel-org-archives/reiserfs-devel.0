From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Tue, 05 Jul 2005 17:15:34 -0700
Message-ID: <42CB22A6.40306@namesys.com>
References: <hubert@uhoreg.ca>	<200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>	<87hdfgvqvl.fsf@evinrude.uhoreg.ca>	<8783be6605062914341bcff7cb@mail.gmail.com>	<878y0svj1h.fsf@evinrude.uhoreg.ca> <42C4F97B.1080803@slaphack.com> <87ll4lynky.fsf@evinrude.uhoreg.ca> <42CB0328.3070706@namesys.com> <42CB07EB.4000605@slaphack.com> <42CB0ED7.8070501@namesys.com> <42CB1128.6000000@slaphack.com> <42CB1C20.3030204@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24975-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CB1C20.3030204@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Hubert Chan <hubert@uhoreg.ca>, Ross Biro <ross.biro@gmail.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>, Nate Diller <ndiller@namesys.com>

If we also add to this the restriction that once you create the file
part of a file-directory, you can never hardlink to a child of it, it
should then all work, yes?

So, /filename/..../owner should be able to avoid colliding with any
common names by virtue of the '....', and not letting any filedir
(file-directory) have children with links to them should also work.  The
one thing that seems inelegant is that when you create the file part of
a filedir, you must check all its children for hardlinks and fail if
they exist, and you must flag all its directory children so that the
plugins for them will disallow hardlinks to their children from that
point onward.  Still, seems workable....

Thanks David,

Hans

Hans Reiser wrote:

>David Masover wrote:
>
>  
>
>>Now, can anyone think of a situation where we want user-created
>>hardlinks inside metadata?  More importantly, what do we do about it?
>> 
>>
>>    
>>
>I think the equivalent of symlinks would be good enough to get by on for
>now for most linking of metafiles.  Maybe some years from now somebody
>can fault me for saying this and write a patch to fix it to be better,
>at which point I will be happy to concede the point.
>
>So the basic principal here is, one can have hardlinks to directories
>without cycles provided that one does not allow any child of the
>directory to have a hardlink.  The question is, how cleanly can that
>relaxed restriction be coded?
>
>Hans
>
>  
>

