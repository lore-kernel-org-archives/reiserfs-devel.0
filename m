From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Multiple data streams...
Date: Wed, 2 Apr 2003 21:13:10 +0400
Message-ID: <16011.6694.600468.304009@laputa.namesys.com>
References: <6167696812.20030402112847@tnonline.net>
	<3E8B0BED.2070004@suse.com>
	<3E8B1572.1010001@namesys.com>
	<1049303242.15216.1023.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13539-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1049303242.15216.1023.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: Hans Reiser <reiser@namesys.com>, Jeff Mahoney <jeffm@suse.com>, Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

Chris Mason writes:
 > On Wed, 2003-04-02 at 11:53, Hans Reiser wrote:
 > > Users should know that these will never be accepted into ReiserFS, and 
 > > the reasons why are explained at www.namesys.com/v4/v4.html
 > 
 > They should also know that suse has committed to supporting the ACL and
 > xattr patches.  It's an important feature to our customers, so we more
 > or less had to choose between making something else the default and
 > giving reiserfs the features needed for it to compete in the enterprise
 > market.
 > 
 > We chose the latter ;-)
 > 

Actually, locking ACLs out of mainline gives SuSe competitive advantage
over, say, some other distribution that would like to use Reiserfs. In
such situation that "other distribution" would probably opt for not
using reiserfs at all.

 > -chris
 > 

Nikita.

 > 
 > 
 > 
