From: Christoph Lameter <clameter@sgi.com>
Subject: Re: short term task list for Reiser4
Date: Thu, 13 Jul 2006 12:17:31 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0607131215310.28976@schroedinger.engr.sgi.com>
References: <44B42064.4070802@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28991-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44B42064.4070802@namesys.com>
Sender: Christoph Lameter <christoph@schroedinger.engr.sgi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>, LKML <linux-kernel@vger.kernel.org>

Will there be any NUMA /SMP fixes? Reiserfs performance is severely 
impacted at higher processor counts by the mandatory centralized locking 
in both read and write paths in the filesystem.
