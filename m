From: Dave Poirier <dpoirier@dsfm.mb.ca>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Wed, 07 Apr 2004 13:22:20 -0500
Message-ID: <a9e27b0360.b0360a9e27@cyberschools.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-17784-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-language: fr
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


----- Original Message -----
From: Hubert Chan <hubert@uhoreg.ca>
Date: Wednesday, April 7, 2004 1:07 pm
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26

(snip!)
> Well, I don't know exactly what Mr. Demidov was thinking, but I know
> that one common complaint about Perl is the punctuation in front of
> variable names.  However, for UNIX filesystems, there's a lot of
> precedent for at least a single leading dot in filenames, so I don't
> think it should be a problem to call it ".metas".  It is also not
> something that would be extremely common, so it wouldn't be like
> havinga Perl program pocked with punctuation.  (Alliteration
> unintentional.)
> The leading dot also flags the file as being somewhat "special" -- two
> leading dots would flag it as being more so.  Although my own personal
> sense of aesthetics is biased against two dots, using two dots
> would be
> well justified, and I personally wouldn't consider it a critical
> issue.
(snip!)

I was thinking from a user point of view when browsing a directory structure or even simply listing files, normally files/directories starting with a single dot are hidden (by default), and in graphical modes their icons are shaded to signify they are special files/directories.

I believe it would make sense to have the "metas" folder hidden or shaded rather than always displayed, it would be less intrusive for users not requiring access to those files.

Sorry for the intrusion, I'm kindof new to this list, looking forward to collaborate with you all,

Dave Poirier
Unununium Operating System
http://unununium.org/

