From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Why no pseudo_dir.c:get_parent()?
Date: Sat, 17 Dec 2005 15:01:05 -0800
Message-ID: <200512171501.05867.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27418-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

We need more pseudo_dir methods than you have defined, so we are extending the model slightly. In this process, we discovered this:

/* pseudo files are not serializable (currently). So, this should just return an
 * error. */
reiser4_internal struct dentry *
get_parent_pseudo(struct inode *child)
{
	return ERR_PTR(RETERR(-ENOTSUPP));
}

Please comment on why this returns -ENOTSUPP instead of returning the host file/pseudo file which is the parent of the current directory.
-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
