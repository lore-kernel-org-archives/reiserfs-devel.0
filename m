From: <doiggl@velocitynet.com.au>
Subject: Re: Which patches can be applied on top of reiser4-for-3.15.1.patch.gz
Date: Sun, 24 Aug 2014 18:09:13 +1000
Message-ID: <ddb1dce22777b95f061191f777a1d349@mail.velocitynet.com.au>
References: <f6e6b313d9543ba6a1ad9a5707637dc8@mail.velocitynet.com.au> <14374339.ZjIIAzvjXL@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <14374339.ZjIIAzvjXL@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On Wed, 20 Aug 2014 12:14:41 +0400, Ivan Shapovalov <intelfx100@gmail.com>
wrote:
> On Wednesday 20 August 2014 at 17:42:52, doiggl@velocitynet.com.au
wrote:	
>> Hello,
>> 
>> Which patches can be applied on top of reiser4-for-3.15.1.patch.gz
>> 2014-08-09 616.4 kB 
>> I see this listing[1]  [sorted by date] in
>> http://www.spinics.net/lists/reiserfs-devel/maillist.html
>> Thanks Glenn
> 
> The patches marked with [RFC] are pre-experimental, that is, "request
for
> comments". They are not to be applied to any configuration with
significant
> data, not to mention in any way production systems.
> 
> Remaining ones are a bit less experimental, but anyway -- they are still
> up to
> review. Testing is appreciated, but... it can result in anything.
> 
> Currently there are three actual patchsets "in flight":
> 
> - [RFC] [PATCHv3 0/9] reiser4: batch discard support (FITRIM ioctl):
> initial implementation.
> - [PATCH 0/2] reiser4: block deallocation fixes.
> - [PATCH 0/3] reiser4: space grabbing fixes.
> 
> The main discard support patchset,
> 
> - [PATCHv7 0/6] reiser4: discard support: simplified and race-free
initial
> implementation.
> 
> is already reviewed by Edward and uploaded to sourceforge under name of
> 3.15.1-reiser4-basic-discard-support.patch.gz. It is to be applied on
top
> of
> reiser4-for-3.15.1.
> 
> The "in-flight" patchsets are to be applied on top of discard support
> patch.
> 
> Hope that helps,

Hello,
Thanks for the details.

rpms did build with following patches applied:
        reiser4-for-3.15.1.patch
        3.15.1-reiser4-basic-discard-support.patch

see link to built rpms url [with above patches applied]
https://build.opensuse.org/package/binaries/home:doiggl/kernel-reiser4?repository=openSUSE_13.1

Question:
Which "in-flight" patchsets can be applied on top of discard support patch
?
Url link to patch appreciated.

Cheers Glenn
