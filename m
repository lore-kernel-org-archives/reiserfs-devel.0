From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: Why no pseudo_dir.c:get_parent()?
Date: Mon, 19 Dec 2005 17:12:06 +0300
Message-ID: <17318.49078.360934.470331@gargle.gargle.HOWL>
References: <200512171501.05867.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27440-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200512171501.05867.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Peter van Hardenberg writes:
 > We need more pseudo_dir methods than you have defined, so we are extending the model slightly. In this process, we discovered this:
 > 
 > /* pseudo files are not serializable (currently). So, this should just return an
 >  * error. */
 > reiser4_internal struct dentry *
 > get_parent_pseudo(struct inode *child)
 > {
 > 	return ERR_PTR(RETERR(-ENOTSUPP));
 > }
 > 
 > Please comment on why this returns -ENOTSUPP instead of returning the
 > host file/pseudo file which is the parent of the current directory.

I believe, you _can_ implement this method (e.g., as you correctly
mention, by returning host object), but this is not needed:
->get_parent() method is a part of operations vector that reiser4 uses
to generate NFS file-handles for objects (see
reiser4_get_dentry_parent() and reiser4_export_operations).

I didn't want pseudo files to be exported over NFS: for one thing
consistency guarantees provided by NFS protocol are so weak that this
would be a sure path to unpredictably delayed meta-data operations (that
is, a path to hell). Hence, ->get_parent() method of dir_plugin together
with .wire methods of file_plugin for pseudo files were left
unimplemented.

Hope this makes it clear(er).

 > -pvh

Nikita.
