From: Eric <eric225125@yahoo.com>
Subject: Long writebacks with Reiser4 causing system to be unresponisive.
Date: Wed, 24 Jun 2009 03:53:49 +0000 (UTC)
Message-ID: <loom.20090624T033330-133@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

I have been having problems for the past few months where when I'm
doing moderately disk intensive activities (such as downloading a git tree,
using a virtual machine), I will get 1-2min periods where basically nothing
can access the disk.

By watching /proc/meminfo, I can see my dirty memory gradually growing
during these disk intensive activities until it gets very 
large (several 100MB), then my system will be unresponsive until it all
goes through writeback.  This same behavior can be reproduced by manually
running "sync" when the dirty memory is fairly large.

Has anyone else experienced these problems? I noticed that some major
changes were made to how Reiser4 uses dirty memory
(http://lkml.org/lkml/2009/2/13/106).  I believe I started seeing
this problem around that time. Could that have caused it?

(Sorry for my vague and probably inaccurate description of the problem;
I know very little about virtual memory and file systems).

