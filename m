From: Hans Reiser <reiser@namesys.com>
Subject: Re: Multiple data streams...
Date: Thu, 03 Apr 2003 22:37:24 +0400
Message-ID: <3E8C7F64.8020008@namesys.com>
References: <6167696812.20030402112847@tnonline.net>	<3E8B0BED.2070004@suse.com>	<3E8B1572.1010001@namesys.com>	<1049303242.15216.1023.camel@tiny.suse.com> <16011.6694.600468.304009@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16011.6694.600468.304009@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Chris Mason <mason@suse.com>, Jeff Mahoney <jeffm@suse.com>, Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

Nikita Danilov wrote:

>Chris Mason writes:
> > On Wed, 2003-04-02 at 11:53, Hans Reiser wrote:
> > > Users should know that these will never be accepted into ReiserFS, and 
> > > the reasons why are explained at www.namesys.com/v4/v4.html
> > 
> > They should also know that suse has committed to supporting the ACL and
> > xattr patches.  It's an important feature to our customers, so we more
> > or less had to choose between making something else the default and
> > giving reiserfs the features needed for it to compete in the enterprise
> > market.
> > 
> > We chose the latter ;-)
> > 
>
>Actually, locking ACLs out of mainline gives SuSe competitive advantage
>over, say, some other distribution that would like to use Reiserfs. In
>such situation that "other distribution" would probably opt for not
>using reiserfs at all.
>
>
> > -chris
> > 
>
>Nikita.
>
> > 
> > 
> > 
>
>
>
>  
>
and if we introduce a non-compatible version of ACLs into the mainline....

There are the Unix wannabes and those who want to build something 
better.  There aren't actually a lot who want to build something better 
than what has passed before.... but then there never is.....

Reiser4 is not going to adopt the wait until some other OS has used a 
feature for 5 years, and then adopt it approach that Ted Tso suggested 
on one occasion (I think we were discussing upcoming reiser4 features;-) ).

This is a natural friction between those who want Linux to quickly 
become like Unix, and those who think Unix is not necessarily all that 
we could be.  I suspect that as Linux matures this is going to become 
more and more of an issue, because those who are able to copy features 
effectively are not those who are able to add new ones, but those who 
copy will be entrenched in the power structure.  It will be much like 
the competition between slow growth and fast growth vegetation in the 
forest: both approaches have their place in the ecosystem and both seek 
to displace the other.

What we should all remember though is that everyone is trying to make 
Linux better as best as they can, and so let us not make a big deal out 
of this ACL fork because little positive will come out of it (please 
take note of this point Nikita).

-- 
Hans


