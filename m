From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Carrying Attributes too Far
Date: Tue, 23 Sep 2003 18:48:31 -0400 EDT
Message-ID: <1809297981-BeMail@cr593174-a>
References: <1064280061.3f6f9ffd2c514@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15732-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1064280061.3f6f9ffd2c514@webmail.st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

lrc1@st-andrews.ac.uk wrote on Tue, 23 Sep 2003 02:21:01 +0100:
> The question is whether the subfile metadata system will 
> be compatible with permissions systems in which a user is able to revoke his 
> own permissions to a file and then return them again - such as the current
> Unix  permissions system - and what bodges you would accept to make it
> compatible.

That's a detail for deep thought, but I'll let someone else worry about it for now.

In my shallow thoughts, I'm leaning to having attributes identical to files, and permissions as a kind of attribute.  The attribute's permission would be inherited from the file's permissions, if they don't have their own permission attributes (same inheritance rules for file permissions too).

A simple case would be to have only owners allowed to write, anyone to read (I said it was simple).  Have an "owner" attribute.  Only the matching user can write to a file marked with that attribute.  Only the matching user can write to the file's contents, including data, attributes, which of course includes the owner attribute itself.  Of course, this means the owner can give ownership of the file away to anyone he wants to (and contents if they don't have explicit permission attributes of their own).

That's just an example of a simple security scheme.  A real one would be more sophisticated.  And somebody else's problem :-)

- Alex
