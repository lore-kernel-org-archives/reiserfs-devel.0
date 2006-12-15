From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: Rescue cds for fsck'ing reiser4?
Date: Fri, 15 Dec 2006 21:21:43 +0100
Message-ID: <194f62550612151221s648e80e8q570a7e1934adf3e1@mail.gmail.com>
References: <194f62550612151028m1e006131w38d3f941e6e2e39e@mail.gmail.com>
	 <4582F0CB.6030703@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30327-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4582F0CB.6030703@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward@namesys.com>, reiserfs-list@namesys.com

Hi again,

> 1. make sure you have reiser4progs-1.0.6 installed
> 2. close all applications.
> 3. start single mode (init 1).
> 4. remount root partition to "readonly".
> 5. run fsck.reiser4 root_device_name (if you use cryptcompress, then pass
>    options -n --fix for the first run).

Ooops. I did not pass the -n --fix options first, but let fsck.reiser4
run without any additional options - it stopped with 2 corruptions. I
decided not to do anything further because I already lost data with
reiser3's fsck.reiser.

When rebooting mount claims that it will only load reiser4 read-only
because it contains errors but it ends up that it can't be mounted at
all.

Now I tried to re-run with exactly the options you gave me (I had a
disk with the same kernel / toolset laying arround) gut it bails out
with "1 fatal corruption was found". It says the storage tree does not
exist.

Any options to get my data back without rebuilding the filesystem. How
likely is it to get my data back if I choose to rebuild it. I wrote
some quite tricky pieces of code lately ... would be sad to loose them
:-/

Thank you in advance, lg Clemens
