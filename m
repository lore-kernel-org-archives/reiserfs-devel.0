From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 01/14] VFS: Don't use save/replace_mount_options if not using generic_show_options
Date: Wed, 05 Jul 2017 16:33:29 +0100
Message-ID: <21063.1499268809@warthog.procyon.org.uk>
References: <20170705113023.4dbbc3a6@gandalf.local.home> <149926824154.20611.6104595541055328700.stgit@warthog.procyon.org.uk> <149926824918.20611.721200514474820755.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4E53F8047E
In-Reply-To: <20170705113023.4dbbc3a6@gandalf.local.home>
Content-ID: <21062.1499268809.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: dhowells@redhat.com, viro@zeniv.linux.org.uk, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org

Steven Rostedt <rostedt@goodmis.org> wrote:

> As this is patch 1/14, is there any dependency on this working? That
> is, it is safe to simply remove this caller from those locations? Or
> are there dependencies on having any of the 2-14 patches added to make
> it not cause issues?

Patch 14 removes the then-unused helpers, but patches 1-13 otherwise are
independent of each other and have no dependencies on earlier patches.

David
