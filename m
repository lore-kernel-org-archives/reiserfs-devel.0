From: lrc1@st-andrews.ac.uk
Subject: Re: Carrying Attributes too Far
Date: Wed, 24 Sep 2003 17:57:49 +0100
Message-ID: <1064422669.3f71cd0d6f384@webmail.st-andrews.ac.uk>
References: <1809297981-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15735-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1809297981-BeMail@cr593174-a>
Content-Transfer-Encoding: 8bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Quoth "Alexander G. M. Smith" <agmsmith@rogers.com>:

> lrc1@st-andrews.ac.uk wrote on Tue, 23 Sep 2003 02:21:01 +0100:
> > The question is whether the subfile metadata system will 
> > be compatible with permissions systems in which a user is able to revoke
> his 
> > own permissions to a file and then return them again - such as the current
> > Unix  permissions system - and what bodges you would accept to make it
> > compatible.
> 
> That's a detail for deep thought, but I'll let someone else worry about it
> for now.
> 
> In my shallow thoughts, I'm leaning to having attributes identical to files,
> and permissions as a kind of attribute.  The attribute's permission would be
> inherited from the file's permissions, if they don't have their own
> permission attributes (same inheritance rules for file permissions too).

Yes, this is probably the best approach to subfile metadata, at least on the
face of it. Now consider the case where Alice owns a file with subfile metadata,
and Bob has read access to the file's subfile metadata directory. What should
happen when Bob hard-links one of the files in Alice's file's subfile metadata
directory (you know, /home/alice/mypicture/+/thumbnail or whatever) to one of
his directories (say /home/bob/pictures )? Alternatively, what should prevent
this from happening?

> 
> A simple case would be to have only owners allowed to write, anyone to read
> (I said it was simple).  Have an "owner" attribute.  Only the matching user
> can write to a file marked with that attribute.  Only the matching user can
> write to the file's contents, including data, attributes, which of course
> includes the owner attribute itself.  Of course, this means the owner can
> give ownership of the file away to anyone he wants to (and contents if they
> don't have explicit permission attributes of their own).

And this is a major security hole, yes? Any user who can create files can give
any other user little presents like arbitrary setuid binaries ("and this one's
for you, root") or a few thousand 200MB files of garbage ("Oh dear, I seem to
have used up your quota..."). How would you fix these problems, without
resorting to an even simpler system with no setuid and no quotas? (And a system
without quotas is pretty much at the mercy of untrusted users anyway.)

> 
> That's just an example of a simple security scheme.  A real one would be more
> sophisticated.  And somebody else's problem :-)
> 

The Unix permissions system isn't exactly the acme of sophistication. Ordinary
implementations of it are pretty straightforward. Isn't it worrying if
implementing it using subfile metadata seems to require some kind of profound
insight? Aren't you concerned that maybe there /is/ no really good solution,
that all possible solutions involve nasty compromises?

> - Alex

Thanks for taking up the challenge, and I look forward to your next attempt. I
apologise for stringing you along; I'm not doing it to be irritating or smug. If
I sat down to describe all the attemptable solutions I can think of, and why
they won't work or are bad news, I'd eventually produce another tedious
multi-thousand-word essay, and I still wouldn't anticipate all possible objections.

Leo.

-----------------------------------------------------------------
University of St Andrews Webmail: http://webmail.st-andrews.ac.uk
