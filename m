From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 01 Sep 2004 16:21:03 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <871xhld9lc.fsf@uhoreg.ca>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl> <Pine.LNX.4.58.0408311252150.2295@ppc970.osdl.org>
 <1094040615.2474.50.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>>>>> "Alan" == Alan Cox <alan@lxorguk.ukuu.org.uk> writes:

Alan> The icon doesn't belong in the document, that was a catastrophic
Alan> disaster in early MacOS (although they only use an index). Users
Alan> want to manage their icon choices, tags, tooltip notes and
Alan> attached labels, and you cannot do that in the file if you don't
Alan> own the file.

Most desktop environments provide defaults, but let the user customize
their own settings.  The substream *could* (I'm not saying if it's a
good idea.  It's just a possibility.) be used to provide a default
icon.

Alan> Also the icon is *not* unrelated to the file in a modern GUI, eg
Alan> rox and nautilus uses scaled versions of the content for many
Alan> media types and will show you pictures, frames from a movie etc to
Alan> help you remember the content.

For documents, the icon is not completely unrelated, but it isn't
something that can be directly extracted.  Generating thumbnails
usually takes time, so the filemanagers need to cache it somewhere.
Right now, they use ~/.thumbnails (at least that's what freedesktop.org
recommends), but then you run into consistency issues -- when you delete
the file, the thumbnail should be deleted too, and when you rename/move
the file, the thumbnail should be attached to the new filename, and not
have to be regenerated.

Alan> On top they then add user specific annotations.

And I think that would be a good use of substreams/attributes/metas
too.  You don't really want to store it in some separate location,
because you run into the same consistency issues as I mentioned
before.  Sure, if you move a file using Nautilus, it may be smart
enough to move the annotations, but I'd bet that mv doesn't know what
to do.

Alan> The things that are more independant are:

Alan> "This file was created by OpenOffice 1.2" "This is a text/plain
Alan> file in UTF-8" "This file has a UUID of ...."

Alan> The type has dragons because you get heirarchical typing within
Alan> documents (consider XML containing namespaces)

Well, I think the web guys are going to have to figure something out,
and we can just follow what they do ...

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

