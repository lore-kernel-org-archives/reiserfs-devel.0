From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: More on Hard Links
Date: Thu, 22 Jan 2004 16:15:59 -0500 (EST)
Message-ID: <20040122211559.17554.qmail@web25001.mail.ukl.yahoo.com>
References: <87n0a1wex1.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1465724530-1074806159=:16451"
Return-path: <reiserfs-list-return-16612-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87n0a1wex1.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hubert Chan <hubert@uhoreg.ca>, reiserfs-list@namesys.com

--0-1465724530-1074806159=:16451
Content-Type: text/plain; charset=us-ascii
Content-Id: 
Content-Disposition: inline

Sorry for the very long delay in responding; I have
been detained.

Hubert Chan wrote:

> Here's a use case: there's a shared file, "foo.txt",
> that I am working
> with collaboratively with a bunch of other people. 
> It resides on a
> network volume.  I decide I want a local copy on my
> laptop, so I make a
> hardlink on my local disk.  Now I take my laptop
> home, so it's no
> longer connected to the network.  The other guys
> want to make some
> changes, but since the file has a remote link that
> isn't mounted, it's
> unwritable.  The guys are annoyed at having to copy
> the file, leaving
> "foo.txt" hanging there.  (They're even more annoyed
> when they find out
> that I had mass-hardlinked the whole directory.) 
> They track me down
> and beat me up. :-P
> 
> It's even worse if "foo.txt" was, say, actually a
> configuration file in
> /etc, so you can't just copy it and make changes,
> because the program
> won't be able to find the new version.
> 
> It's a bit of a contrived example, but not
> *completely* ridiculous.

It's not ridiculous at all... you have a very good
point.

I've given this a lot of thought, and firstly have
come to believe that it is misguided to discuss user
features that should be added to Hard Links.  Hard
Links are a low-level feature of the underlying file
system, and should be treated as such. 

Instead, in a discussion about user features, we
should first identify the features that we want, then
design a higher-level construct (which may make use of
hard links in its implementation, possibly directly)
that delivers these features.  

I can think of only 2 user-level linking constructs
that I think would be useful:

(1) "Aliases" (Inspired only partially by Mac OS
aliases.)

- A user can create an alias of any file.
- An alias can be created on any volume whose file
system supports aliases.
- Aliased files look/act exactly like their master
unless they are disconnected 
(i.e. the target is on an unmounted volume).
- Disconnected aliases have some sort of icon badge.
- When an alias is created on another volume, the user
will be asked if the alias should keep a local cache
of the master.  If so, the file can still be read (but
not modified) when disconnected.  If not, then it is
not readable when disconnected.

(2) "Shortcuts" (This is just a name; I am *not*
referring to Windows-style shortcuts.)

- Contain a path of a target file.
- Act like the target file (if resolvable), and the
icon of the file shows some sort of badge (an arrow,
for example).

Shortcuts would be implemented directly using symbolic
links.

Aliases on the same volume could be implemented using
hard links.  However, to implement aliases that span
volumes, I have attached a *very rough* description of
how this could be done, using a hypothetical low-level
construct I have called "cloning".

What do you think?

Cheers,
N. Electron

-------------------

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
--0-1465724530-1074806159=:16451
Content-Type: text/plain; name="aliases.txt"
Content-Description: aliases.txt
Content-Disposition: inline; filename="aliases.txt"



CLONING

- Pertains to the underlying file structure (think inode), which will henceforth be simply called a "file".
- Any file can be "cloned".
- A clone can be created on any volume whose file system supports cloning.
- When a file is cloned, it becomes the "master".
- Clones are guaranteed to be either identical to the master, a read-only snapshot of the master (i.e. disconnected with cached copy), or not readable (i.e. disconnected with no cache).

How (very roughly):

- Each file can have a master file ID, specifying volume ID and an inode number-type identifier (I'll just call it the inode number).
- Each file can have a "clone list", which is a list of clone files (by file ID) and a bit indicating whether or not the clone is "dirty" (its cache is out of sync).
- When committing a transaction to a file:
	- If it has a master file ID, but the volume ID is unresolvable:
		- The file is currently disconnected from the master.  No transaction is committed.
	- Otherwise (it has no master file ID, or it has a master file ID with a resolvable volume ID):
		- If it has a master file ID:
			- If the master file ID's inode number is unresolvable, or the current file is not in the master file's clone list:
				- This file is no longer a clone.  Clear the master file ID.
			- Otherwise:
				- Commit the transaction to the master.
		- If it has no master file ID:
			- Commit the transaction to this file.
		- If it has a clone list:
			- For each clone file ID:
				- If the volume is unresolvable:
					- Don't commit the transaction to the clone file.
					- Mark this item in the clone list as "dirty".
				- Otherwise, if the clone file ID's inode number is unresolvable:
					- Remove its file ID from the current file's clone list.
				- Otherwise, if the clone file's master file ID is not for the current file:
					- The file is no longer a clone.  Clear its master file ID.
					- Remove its file ID from the current file's clone list.
				- Otherwise:
					- Commit the transaction to the clone file.
					- Mark this item in the clone list as "clean".
- When attempting to read a file:
	- If it has a master file ID with a resolvable volume ID:
		- If the master file ID's inode number is unresolvable, or the current file is not in the master file's clone list:
			- This file is no longer a clone.  Clear the master file ID.
		- Otherwise, if the current file is marked "dirty" in the master file's clone list:
			- Update the file from the master.
			- Update the entry as "clean".
	- Read the file.

Requirements:

- File ID must work reliably.  Volume ID must be reliable, and inode number must 
be retained, even after modifications to the file, etc.

Additional ideas:

- Volume ID could also specify the computer that the volume is on, so that clones could span computers or at least be computer-specific.
- Could perhaps add functionality that attempts to automatically mount the master file's volume, temporarily, when trying to commit a transaction to a disconnected clone.

--0-1465724530-1074806159=:16451--
