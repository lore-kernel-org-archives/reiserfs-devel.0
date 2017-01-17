From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH 7/8] Revert "ext4: avoid deadlocks in the writeback path
 by using sb_getblk_gfp"
Date: Mon, 16 Jan 2017 22:01:18 -0500
Message-ID: <20170117030118.727jqyamjhojzajb@thunk.org>
References: <20170106141107.23953-1-mhocko@kernel.org>
 <20170106141107.23953-8-mhocko@kernel.org>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thunk.org; s=ef5046eb;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=2Z2FFu+CY6H93al56zjCP5TAcAWJkSvnLEs6bNDdAt0=;
	b=rtSusJpxdfGAol3yiqKIe/jEUVZFWXnACJ2CBjgK6OXGL1YW7NYaLz7R1hDhSi6cIUti7YqxWT8dgwXCwLOglO6LoVlotTr3r4yidkmZYmydT2uoAl/b53UfVzn4N8Y4qdeM3djmyJSHXsuovyYNsLE1rY/OxqvHcH10auVE/MA=;
Content-Disposition: inline
In-Reply-To: <20170106141107.23953-8-mhocko@kernel.org>
Sender: owner-linux-mm@kvack.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Hocko <mhocko@kernel.org>
Cc: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dave Chinner <david@fromorbit.com>, djwong@kernel.org, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.cz>, Jan Kara <jack@suse.cz>, ceph-devel@vger.kernel.org, cluster-devel@redhat.com, linux-nfs@vger.kernel.org, logfs@logfs.org, linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-mtd@lists.infradead.org, reiserfs-devel@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, linux-f2fs-devel@lists.sourceforge.net, linux-afs@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>

On Fri, Jan 06, 2017 at 03:11:06PM +0100, Michal Hocko wrote:
> From: Michal Hocko <mhocko@suse.com>
> 
> This reverts commit c45653c341f5c8a0ce19c8f0ad4678640849cb86 because
> sb_getblk_gfp is not really needed as
> sb_getblk
>   __getblk_gfp
>     __getblk_slow
>       grow_buffers
>         grow_dev_page
> 	  gfp_mask = mapping_gfp_constraint(inode->i_mapping, ~__GFP_FS) | gfp
> 
> so __GFP_FS is cleared unconditionally and therefore the above commit
> didn't have any real effect in fact.
> 
> This patch should not introduce any functional change. The main point
> of this change is to reduce explicit GFP_NOFS usage inside ext4 code to
> make the review of the remaining usage easier.
> 
> Signed-off-by: Michal Hocko <mhocko@suse.com>
> Reviewed-by: Jan Kara <jack@suse.cz>

If I'm not mistaken, this patch is not dependent on any of the other
patches in this series (and the other patches are not dependent on
this one).  Hence, I could take this patch via the ext4 tree, correct?

     	    	     	   	     - Ted

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
