From: Perry Kundert <perry.kundert@gmail.com>
Subject: Re: EACCESS vs ENOENT for nonexistent files-within-files
Date: Thu, 16 Sep 2004 16:40:37 -0600
Message-ID: <2f9ccaae04091615404085f41e@mail.gmail.com>
References: <20040915151803.vl9es48kkosg4k88@www.wagland.net>
	 <16712.21927.550122.367489@thebsh.namesys.com>
	 <200409162055.38364.tdickenson@geminidataloggers.com>
	 <2f9ccaae04091615395cfd0730@mail.gmail.com>
Reply-To: perry@kundert.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21829-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f9ccaae04091615395cfd0730@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, 16 Sep 2004 20:55:38 +0100, Toby Dickenson
<tdickenson@geminidataloggers.com> wrote:
> On Wednesday 15 September 2004 15:45, Nikita Danilov wrote:
>
> > The real problem is that in reiser4 regular files and directories are
> > indistinguishable by design.
>
> Indistinguishable?
>
> Ive been following the reiser4 message so far and felt comfortable with
> performing directory-like operations on files. But I think this is the first
> mention that files and directories would be *indistinguisable*. What does
> 'ls' show, and how?


    I would agree.  Clearly, in reiser4 'files' can (optionally) have
a 'directory' personality, presumably containing metadata associated
with the file (and hence, being accessible with the same level of
access as the file itself).  If you want to have data that is NOT
accessed with the same level of permissions as the file -- then don't
put it "in" the file's 'directory'!

    The obverse would be true of a 'directory' with metadata; This
directory's metadata would be accessible with the same level of
permission as the directory.

    If the primary "personality" of a file and directory are
indistinguishable (which I don't believe is true), then every
filesystem file/directory will indeed need two sets of permissions;
one for accessing it as a "file", and one for accessing it as a
"directory".  This is, of course, ridiculous, and will break
everything worse than the concept of file's w/ a directory of metadata
ever would, on its own.

--
    -pjk

> --
> Toby Dickenson
>
