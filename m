From: Andrew Clausen <clausen@gnu.org>
Subject: Re: aal_assert()
Date: Sat, 11 Jan 2003 00:26:28 +1100
Message-ID: <20030110132628.GA1056@gnu.org>
References: <20021231005440.GA1573@gnu.org> <15901.23872.24060.68353@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12305-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <15901.23872.24060.68353@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@namesys.com

On Thu, Jan 09, 2003 at 02:30:08PM +0300, Nikita Danilov wrote:
> These "message ids" are traditional way reiserfs code uses to identify
> errors (probably because early during development preprocessor features
> were unknown) and Hans feels himself attached to them emotionally. :-)

Well, I'll give some arguments against this scheme:

(1) it's more code, more work, more space, etc.  Programmers are
minimalists, and adding extra stuff feels dirty.

(2) "ids" are the Wrong Way to identify things... things should
be identified by their essence, not by tags.  This is the whole
OO vs relational database flamewar.  Relational databases
(the "by essense/being, not tag") won, game over.

You don't query things by tags, but by what they are.

I know this is all quite subjective... I just wanted to provide
some emotional arguments as well as rational ones *grin*

Another thing: I'd like to see libaal reused in all file system
tool implementations.  That's my main motivation for cleaning it
up.  My first target is ntfs...

Cheers,
Andrew

