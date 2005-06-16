From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: [PATCH] ReiserFS _get_block_create_0 wrong behavior when I/O
	fails
Date: Thu, 16 Jun 2005 14:46:59 +0400
Message-ID: <1118918818.9357.83.camel@tribesman.namesys.com>
References: <1118865954.4231.4.camel@CoolQ>
	 <1118850101.17622.579.camel@tribesman.namesys.com>
	 <1118941347.2886.2.camel@CoolQ>
	 <1118918486.3851.77.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24394-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1118918486.3851.77.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fs <fs@ercist.iscas.ac.cn>
Cc: reiserfs-list@namesys.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Hans Reiser <reiser@namesys.com>

Hello

On Thu, 2005-06-16 at 14:41, Vladimir Saveliev wrote:
> Hello
> 
> On Thu, 2005-06-16 at 21:04, fs wrote:
> > Dear Vladimir Saveliev,
> > On Wed, 2005-06-15 at 11:41, Vladimir Saveliev wrote:
> > 
> > > > Patch:
> > > > diff -uNp /tmp/linux-2.6.12-rc6/fs/reiserfs/inode.c /tmp/linux-2.6.12-rc6.new/fs/reiserfs/inode.c
> > > > --- /tmp/linux-2.6.12-rc6/fs/reiserfs/inode.c	2005-06-06 11:22:29.000000000 -0400
> > > > +++ /tmp/linux-2.6.12-rc6.new/fs/reiserfs/inode.c	2005-06-15 13:56:45.552564512 -0400
> > > > @@ -254,6 +254,7 @@ static int _get_block_create_0 (struct i
> > > >      char * p = NULL;
> > > >      int chars;
> > > >      int ret ;
> > > > +    int result ;
> > > >      int done = 0 ;
> > > >      unsigned long offset ;
> > > >  
> > > > @@ -262,7 +263,8 @@ static int _get_block_create_0 (struct i
> > > >  		  (loff_t)block * inode->i_sb->s_blocksize + 1, TYPE_ANY, 3);
> > > >  
> > > >  research:
> > > > -    if (search_for_position_by_key (inode->i_sb, &key, &path) != POSITION_FOUND) {
> > > > +    result = search_for_position_by_key (inode->i_sb, &key, &path) ;
> > > > +    if (result != POSITION_FOUND) {
> > > >  	pathrelse (&path);
> > > >          if (p)
> > > >              kunmap(bh_result->b_page) ;
> > > > @@ -270,7 +272,8 @@ research:
> > > >  	// That there is some MMAPED data associated with it that is yet to be written to disk.
> > > >  	if ((args & GET_BLOCK_NO_HOLE) && !PageUptodate(bh_result->b_page) ) {
> > > >  	    return -ENOENT ;
> > > > -	}
> > > > +	}else if (result == IO_ERROR)
> > > > +		return -EIO ;
> > > >          return 0 ;
> > > >      }
> > > >      
> > > 
> > > Your patch is incomplete. There is one more search_for_position_by_key
> > > at the end of this function. You probably want to check its return value
> > > also.
> > I notice there's a comment
> > 	if (search_for_position_by_key (inode->i_sb, &key, &path) !=
> > POSITION_FOUND)
> > 	    // we read something from tail, even if now we got IO_ERROR <-
> > Here, can you explain more ?


Yes. reiserfs may store file page in different blocks. In this do {}
while loop it looks for different parts of page in the tree. If
search_for_position_by_key fails - one part of page is not found and
-EIO is to be returned.

> > 	    break;
> > 
> > 
> > 
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > Please read the FAQ at  http://www.tux.org/lkml/
> > 

