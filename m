From: carlos@fisica.ufpr.br (Carlos Carvalho)
Subject: reiser3: data=journal causes panic in 2.6.29.4
Date: Fri, 19 Jun 2009 11:43:31 -0300
Message-ID: <19003.42003.291323.769232@fisica.ufpr.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Putting data=journal in the options in fstab makes the kernel stop at
boot complaining it couldn't get a lock. What's the status of data
journaling in reiser3?
