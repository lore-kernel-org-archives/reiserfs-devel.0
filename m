From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Repeatable corruption using Reiserfs 3
Date: Thu, 30 Oct 2003 14:02:12 +0100
Message-ID: <3FA10BD4.6040800@gmx.net>
References: <3FA0A9D9.70705@netbox.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15941-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FA0A9D9.70705@netbox.biz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Menno Smits <menno@netbox.biz>
Cc: reiserfs-list@namesys.com

Menno Smits wrote:

> - The result is expected and correct. Now look at the tail of the files.
>   The results vary on every run of the test but the contents of the
>   output files are always wrong. Two examples are:
This behaviour is completely correct. Reiserfs V3 does only meta data
journaling by default, which means, that file metadata operations like 
create, delete, etc. are journaled, but not the actual data written to 
the disk.

If you want to prevent data corruption on power failure and not just 
filesystem corruption you have to use Chris Mason's data logging 
patches, see ftp://ftp.suse.com/pub/people/mason/patches/data-logging
These patches provide an additional mount option:
data=writeback: Metadata journaling only
data=ordered: (new default) Data is written to disk before a metadata
               transaction is commited to journal. (nearly as fast as
               writeback, protects against data corruption)
data=journal: Data and metadata are commited to journal and then written
               to disk. (slower, except for mail servers)

-- 
lg, Chris

