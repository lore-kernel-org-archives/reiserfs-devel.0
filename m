From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Fwd: Re: More on Hard Links
Date: Thu, 29 Jan 2004 13:15:34 -0500 (EST)
Message-ID: <20040129181534.9650.qmail@web25007.mail.ukl.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16653-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Forwarding to list...


--- Hubert Chan <hubert@uhoreg.ca> wrote: 
> To: Narcoleptic Electron
> <narcoleptic_electron@yahoo.co.uk>
> Subject: Re: More on Hard Links
> From: Hubert Chan <hubert@uhoreg.ca>
> Date: Thu, 29 Jan 2004 12:57:49 -0500
> 
> >>>>> "Narcoleptic" == Narcoleptic Electron
> <narcoleptic_electron@yahoo.co.uk> writes:
> 
> [...]
> 
> Narcoleptic> I've given this a lot of thought, and
> firstly have come to
> Narcoleptic> believe that it is misguided to discuss
> user features that
> Narcoleptic> should be added to Hard Links.  Hard
> Links are a low-level
> Narcoleptic> feature of the underlying file system,
> and should be
> Narcoleptic> treated as such.
> 
> I agree enthusiastically.
> 
> Narcoleptic> Instead, in a discussion about user
> features, we should
> Narcoleptic> first identify the features that we
> want, then design a
> Narcoleptic> higher-level construct (which may make
> use of hard links in
> Narcoleptic> its implementation, possibly directly)
> that delivers these
> Narcoleptic> features.
> 
> Yes.  Agreed.
> 
> Narcoleptic> I can think of only 2 user-level
> linking constructs that I
> Narcoleptic> think would be useful:
> 
> Narcoleptic> (1) "Aliases" (Inspired only partially
> by Mac OS aliases.)
> 
> [...]
> 
> Narcoleptic> - When an alias is created on another
> volume, the user will
> Narcoleptic> be asked if the alias should keep a
> local cache of the
> Narcoleptic> master.  If so, the file can still be
> read (but not
> Narcoleptic> modified) when disconnected.  If not,
> then it is not
> Narcoleptic> readable when disconnected.
> 
> Interesting idea.  Aside from this point, "aliases"
> could be implemented
> using symlinks, with things like the "disconnected"
> badge handled in
> userspace.
> 
> Instead of using a "clone list" as you suggested,
> keeping the clones up
> to date could be handled in userspace by something
> like FAM (File
> Alteration Monitor).  That way, the target
> filesystem doesn't have to
> know about aliases.
> 
> Narcoleptic> (2) "Shortcuts" (This is just a name; I
> am *not* referring
> Narcoleptic> to Windows-style shortcuts.)
> 
> [...]
> 
> Narcoleptic> Shortcuts would be implemented directly
> using symbolic
> Narcoleptic> links.
> 
> Yup.
> 
> There's another type of link that I think users may
> want -- something
> like symbolic links, but is resilient to file
> movement -- at least
> within the same filesystem.  That could be
> implemented by storing a
> pointer to some sort of filesystem ID, and an inode
> number.  This is
> what I call firm links, and what I think Leo would
> call a soft link.
> 
> -- 
> Hubert Chan <hubert@uhoreg.ca> -
> http://www.uhoreg.ca/
> PGP/GnuPG key: 1024D/124B61FA
> Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29
> C719 124B 61FA
> Key available at wwwkeys.pgp.net.   Encrypted e-mail
> preferred.
>  

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
