From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 data journalling?
Date: Sat, 30 Aug 2003 01:43:25 +0400
Message-ID: <3F4FC8FD.1050303@namesys.com>
References: <3F4E3AF9.2060100@tupshin.com>	<16206.16138.72832.920045@laputa.namesys.com>	<3F4E6AA4.3030900@namesys.com>	<20030829001814.GB9019@zero>	<3F4E9C6D.2080009@namesys.com>	<20030829012322.GJ21352@matchmail.com>	<20030829050857.GA5755@namesys.com>	<3F4F91DB.2080900@namesys.com> <16207.38985.871686.419166@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15498-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16207.38985.871686.419166@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Oleg Drokin <green@namesys.com>, Mike Fedyk <mfedyk@matchmail.com>, Tom Vier <tmv@comcast.net>, Reiserfs List <reiserfs-list@namesys.com>

Nikita Danilov wrote:

>Hans Reiser writes:
> > Oleg Drokin wrote:
> > 
> > >Hello!
> > >
> > >On Thu, Aug 28, 2003 at 06:23:22PM -0700, Mike Fedyk wrote:
> > >
> > >  
> > >
> > >>So you can have one 5k memory area that spans two pages, and it will act on
> > >>them atomically?  Or does that mean that the utils are already page aligned
> > >>by other kernel mechanisims?  Or that they'll have to use the reiser API to
> > >>do some of the above (other than the op grouping)?
> > >>    
> > >>
> > >
> > >Data does not need to be page aligned for atomic operations.
> > >
> > >Bye,
> > >    Oleg
> > >
> > >
> > >  
> > >
> > in reiser4
>
>Why?
>
> 
>
Because atomicity in ext3 basically consists of guaranteeing that the filesystem is consistent, and due to the disk drive implementation 4k blocks are written atomically.  So, if you span more than one block, it is not guaranteed to be atomic.

Someone should correct me if I got it wrong, as ext3 is not my specialty....


