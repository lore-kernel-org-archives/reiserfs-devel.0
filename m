From: Chris Mason <mason@suse.com>
Subject: Re: Multiple data streams...
Date: 03 Apr 2003 14:02:39 -0500
Message-ID: <1049396559.15217.1127.camel@tiny.suse.com>
References: <6167696812.20030402112847@tnonline.net>
	 <3E8B0BED.2070004@suse.com>	<3E8B1572.1010001@namesys.com>
	 <1049303242.15216.1023.camel@tiny.suse.com>
	 <16011.6694.600468.304009@laputa.namesys.com>
	 <3E8C7F64.8020008@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13555-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E8C7F64.8020008@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Jeff Mahoney <jeffm@suse.com>, Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

On Thu, 2003-04-03 at 13:37, Hans Reiser wrote:

> and if we introduce a non-compatible version of ACLs into the mainline....
> 

Grin, the sentence above is more than a little fuzzy.  The v3 ACLs in
the suse kernel are compatible with the acl standards used by the other
linux filesystems.  Any acls in v4 probably want to provide the same
interface, given that many applications in linux do or will support it.

> There are the Unix wannabes and those who want to build something 
> better.  There aren't actually a lot who want to build something better 
> than what has passed before.... but then there never is.....
> 

Shrug, acls as they are is better than no acls.  It's great that you
want to enhance and extend filesystems, their interfaces and performance
over all.  But while that is going on we need to make sure reiserfs
keeps up with the important features the other linux filesystems are
already including.

> What we should all remember though is that everyone is trying to make 
> Linux better as best as they can, and so let us not make a big deal out 
> of this ACL fork because little positive will come out of it (please 
> take note of this point Nikita).

I've no desire to create friction with the ACL fork at all ;-)  It's a
relatively small change that adds a cool feature without altering the
disk format, in other words it was designed to be non-intrusive.

I know that you were concerned about the v3 acl support being a
compatibility problem in v4, but given the acls/xattrs can easily be
exported to a neutral format and then reimported into whatever v4
supports, I don't think it will be a problem.  If it is, we'll work with
you to help fix it.

But none of that is the crucial issue ;-) Your previous message implied
the v3 acl patch was dead and I wanted to assure the people SuSE has
sold it to that we will continue to support it (and them).

-chris


