From: Dan Labute <dan@discreet.com>
Subject: Re: Creating large numbers of files
Date: Tue, 11 Jan 2005 16:34:24 -0500
Message-ID: <41E44660.6090603@discreet.com>
References: <1105395827.2871.ezmlm@namesys.com> <41E302ED.9040606@discreet.com> <20050110231853.GB8098@schnapps.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23117-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050110231853.GB8098@schnapps.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: reiserfs-list@namesys.com

Andreas Dilger wrote:
> On Jan 10, 2005  17:34 -0500, Dan Labute wrote:
> 
>>I'm a developer trying to create large numbers of *empty* files 
>>(~100000).  What is the fastest way to perform such an operation other 
>>than a simple open().  Will using multiple threads to perform concurrent 
>>operations help significantly, or am I just awell-off using a single thread?
> 

> If you call 'mknod("/path/to/file", S_IFREG | 0666, 0)' from a program
> it avoids the overhead of doing both an open and a close.

Thanks Andreas.  I just the change and had minimal results.  Regardless, 
it's the right call to make.

I also tried to use multiple threads (from separate test programs), and 
found that the performance went downhill.  I'm assuming that this would 
indicate that multi-threading the mknod() operations within the same 
executable would yield similar results.  I'm surprised that the combined 
performance was actually worse.

As for link() and unlink() (and mknod), I see no options but to use 
filesystem-specific ioctl() calls.  Does ReiserFS provide any 
batch-operation calls that would yield better performance?
If not, would it be worthwhile to invest in a plug-in?

Any thoughts from the Reiser crew?

Regards,

Dan

