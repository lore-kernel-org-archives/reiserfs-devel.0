From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Debian Stretch on GCE
Date: Tue, 28 Mar 2017 14:55:42 -0700
Message-ID: <CAM12Q5TEGPKuzkWdQJdtsXV4Z4ZacE7q3ZP5cdOZpkFu1P0Saw@mail.gmail.com>
References: <CAA3k+rRJd3A9SjMhiJ6_0WxZHkn03rxtGUEjrMddNAJ_a_9TKg@mail.gmail.com>
 <CAA3k+rQ=M3s3ugXWruzP9v38-O2K+=7yDRJcB9BwoP3M2OgYfg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=Y3ZOuJu29eDzftyNGcsPP7Xj4bkkBA5S6cI1/QKx0RU=;
        b=ej9cw8gePpUN8vy2xmDMpgeZ+cBlVFUAlb7oNEmJ7pvJdKg/SqlQ0xqEA7LcX/Drfc
         nwbMx8ukMMOosLZOgsaOTMsT0GL/5NOfG44bV/W7Z3BjRpx8WtYRrBWsA48P2Jtn3NpA
         ROY4HBB3BgAGPB4LzriTLdMLfbyVE8zdVLp67Jj2V8XDTXy2yV1Dt7nUmgMTBYFqYnTo
         umK8PPBR4gmsaujix3LOf+xLpR4GIvMvhPTwdo7YyvYAEI8r9XTp8905s6F0klustZ47
         hXKLkYNcBNT7oJSQVa7bsRUaqEZkOzuleeeQtTtg9DI0CjDBaUsCxkmpQbxvwgdoqe6k
         Y39w==
In-Reply-To: <CAA3k+rQ=M3s3ugXWruzP9v38-O2K+=7yDRJcB9BwoP3M2OgYfg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zach Marano <zmarano@google.com>
Cc: debian-cloud <debian-cloud@lists.debian.org>

On Tue, Mar 28, 2017 at 1:28 PM, Zach Marano <zmarano@google.com> wrote:
> We published the first GCE Debian 9 Stretch image to the
> `debian-cloud-testing` project. We will be maintaining this image as best as
> we can until Stretch becomes Debian Stable and continue to use this project
> to publish Debian Testing images as time moves on. Let me know if you have
> any feedback.
>
> To try it out you can list the image with `gcloud`:
> `gcloud compute images list --project debian-cloud-testing
> --no-standard-images`
>
> Or start a basic instance:
> `gcloud compute instances create stretch-test --image-project
> debian-cloud-testing --image-family debian-9`
>
> -----
> Zach Marano
> zmarano@google.com
>
> On Tue, Mar 7, 2017 at 10:03 AM, Zach Marano <zmarano@google.com> wrote:
>>
>> Hello Debian Cloud,
>> We have been successfully building Debian Stretch images and having them
>> pass our own test suite. I was wondering what your guidance is on making a
>> Stretch image available to end users before the official release. I was
>> considering publishing them to a separate debian-test project for users who
>> want to be on the cutting edge. Any objections?
>>
>> Also, how are the official Debian Cloud image builds coming along- has
>> there been any new progress?
>>
>> -----
>> Zach Marano
>> zmarano@google.com
>
>

Any chance of including option for Reiser4-patched Linux kernel in
jessie-backports -- which will easily migrate to Stretch?

I have been releasing jessie-backports of reiser4-enabled kernels for
a while; as a matter of fact, I have had a small Debian instance with
reiser4 root fs running on Google Compute Engine for 2 to 3 years now.

As I produce reiser4-patched kernels I have 'eaten my own dog food'. I
use Jessie (stable) on the cloud, and Stretch (testing) and Sid
(unstable) in my development laptop, all on reiser4 fs with virtually
no other file system -- except a small partition for boot in ext2.

Please see bug report of installation on another test cloud provider's
infrastructure:

KVM Cloud instance with 12-cores / 48 Gb RAM

< https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=849268 >

Yesterday, I submitted my most recent jessie-backported kernel
4.9.16-1+reiser4.0.1 installation report:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=858849


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Debian-Reiser4 for AMD64 https://sf.net/projects/debian-reiser4/
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
