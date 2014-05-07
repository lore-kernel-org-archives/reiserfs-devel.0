From: Jan Kara <jack@suse.cz>
Subject: Re: [patch 11/29] reiserfs: cleanup, make hash detection saner
Date: Wed, 7 May 2014 17:50:42 +0200
Message-ID: <20140507155042.GA24732@quack.suse.cz>
References: <20140423140033.704113918@suse.com>
 <20140423151140.523418072@suse.com>
 <20140506212739.GC1220@quack.suse.cz>
 <536A2402.50401@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <536A2402.50401@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Jan Kara <jack@suse.cz>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Dave Jones <davej@redhat.com>

On Wed 07-05-14 08:16:02, Jeff Mahoney wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 5/6/14, 5:27 PM, Jan Kara wrote:
> > On Wed 23-04-14 10:00:44, Jeff Mahoney wrote:
> >> The hash detection code uses long ugly macros multiple times to
> >> get the same value. This patch cleans it up to be easier to
> >> read.
> >> 
> >> Signed-off-by: Jeff Mahoney <jeffm@suse.com> --- 
> >> fs/reiserfs/super.c |  108
> >> ++++++++++++++++++++++++---------------------------- 1 file
> >> changed, 50 insertions(+), 58 deletions(-)
> >> 
> >> --- a/fs/reiserfs/super.c +++ b/fs/reiserfs/super.c @@ -1668,71
> >> +1668,63 @@ static __u32 find_hash_out(struct super_
> > ...
> >> + +	if (deh_hashval == yurahash) +		hash = YURA_HASH; +	else if
> >> (deh_hashval == teahash) +		hash = TEA_HASH; +	else if
> >> (deh_hashval == r5hash) +		hash = R5_HASH; +	else { +
> >> reiserfs_warning(s, "reiserfs-2506", +				 "Unrecognised hash
> >> function"); +		hash = UNSET_HASH; +		goto out; +	} +	return
> >> hash;
> > But you don't call pathrelse(&path) for some cases it seems while 
> > previously it has been called always. Or am I missing something?
> 
> No, it needs to be called. That return should be dropped and we'll
> fall through correctly.
  OK, I've fixed up the patch and merged it to my tree.

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
