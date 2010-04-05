From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: reiserfs + acl corruption
Date: Sun, 4 Apr 2010 18:11:32 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.1004041755070.29272@bogon.housecafe.de>
References: <54cce25c1003280829q2a173c91p55bc3297a3163452@mail.gmail.com> <alpine.DEB.2.01.1004041324340.29272@bogon.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.1004041324340.29272@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Gatti <marco.gatti@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, jeffm@suse.com

On Sun, 4 Apr 2010 at 13:38, Christian Kujau wrote:
> However, this does not happen on a freshly created reiserfs with e.g. just 
> one file on it, I'm still figuring out when exactly this happens.

Got it. After a few more iterations of the testscript[0] I was hitting it 
at 25601 files, 25600 file were fine. Again, setting and removing *one* 
ACL is fine, but removing *all* ACLs lead to I/O error.

After attempting to "setfacl -b", subsequent "ls -l" commands are 
producing I/O errors as well (plus one syslog message for every error). 
"ls" with no "-l" is fine, probably due to the missing stat() calls.

Reiserfsck 3.6.21 did not find any corruptions, yet unmounting/remounting 
the filesystem returns I/O errors whenever I try to stat the directory in 
question. Deleting the files is fine, creating and stat'ing 30001 new 
files in the same directory (I did not remoe it!) is fine too.

Should I open a new bug for this or will this be dealt with in #14826 as 
well?

Thanks,
Christian.

[0] http://nerdbynature.de/bits/2.6.34-rc2/reiserfs/
-- 
BOFH excuse #225:

It's those computer people in X {city of world}.  They keep stuffing things up.
