From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 01/14] VFS: Don't use save/replace_mount_options if not
 using generic_show_options
Date: Wed, 5 Jul 2017 20:50:24 +0200
Message-ID: <20170705185024.GE22044@kroah.com>
References: <149926824154.20611.6104595541055328700.stgit@warthog.procyon.org.uk>
 <149926824918.20611.721200514474820755.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <149926824918.20611.721200514474820755.stgit@warthog.procyon.org.uk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: viro@zeniv.linux.org.uk, reiserfs-devel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org

On Wed, Jul 05, 2017 at 04:24:09PM +0100, David Howells wrote:
> btrfs, debugfs, reiserfs and tracefs call save_mount_options() and reiserfs
> calls replace_mount_options(), but they then implement their own
> ->show_options() methods and don't touch s_options, rendering the saved
> options unnecessary.  I'm trying to eliminate s_options to make it easier
> to implement a context-based mount where the mount options can be passed
> individually over a file descriptor.
> 
> Remove the calls to save/replace_mount_options() call in these cases.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Chris Mason <clm@fb.com>
> cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> cc: Steven Rostedt <rostedt@goodmis.org>
> cc: linux-btrfs@vger.kernel.org
> cc: reiserfs-devel@vger.kernel.org

For debugfs:
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
