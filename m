From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Sun, 10 Aug 2014 21:48:05 +0200
Message-ID: <53E7CC75.2010500@gmail.com>
References: <3405506.BC0S4TX54B@intelfx-laptop> <9580367.jIyNAsIfmQ@intelfx-laptop> <53DACEE9.8000802@gmail.com> <1526377.TUs3NQt8ap@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=1fYBwIZ+u4RiTu09LClO6otalMCWcSAyrwYkeP54bqY=;
        b=zfzz6X69qEIg74nGUL02Jd7IvGP5RsYNtN3TF+6sf4az0kTCyapnOExrXnEkdx45Zh
         7KdcPUMxvf6AYz4DSDJjdQEADkHwLNo18NdWNe6LOdqvtmOlKaHDIAQaJm+71GzuU8+1
         doVycslDWJ1zaXkQY1ymmrDOj/QIPhpXD6voO66I0di2Gz1Wa7VN394bgpS6TsxCcpMa
         D6BWQttgiLls+gFrAWULGcTwQ5A0HxsZM+INDJXepbR9P2UDrF7PCcQ4o7g3fIkrvPEi
         K0E6hQf1j0pw2DBR3yLCdnMXr9xe5yH2JpnzDHrH8oWgfrPwEBxoOItPzWc2r+3RazDA
         Rxew==
In-Reply-To: <1526377.TUs3NQt8ap@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 08/10/2014 08:52 PM, Ivan Shapovalov wrote:
> On Friday 01 August 2014 at 01:19:05, Edward Shishkin wrote:	
>> On 08/01/2014 12:16 AM, Ivan Shapovalov wrote:
>>> [...]
>>> OK. But it still needs to allocate space (even if just to deallocate it
>>> shortly), which means that someone could get ENOSPC while the discard is in
>>> progress, and this ENOSPC will come from the allocator itself.
>>
>> Ah, yes of course, we'll illegally occupy someone's reservation with
>> the following oops...
>>
>>
>>> Do you have any ideas on how to do it gracefully?
>>
>> Define maximal number of allocated blocks in one iteration
>> and reserve this amount of blocks at the beginning of each
>> iteration. Once the limit is exhausted, stop the scan and
>> force to commit the atom.
> This sounds pretty hackish... Isn't there a way to grab all possible space
> at the same time?
> By all possible space I mean (sbinfo->block_count - sbinfo->blocks_used),
> so that `fstrim <mountpoint>` will be efficient even if system is under load
> and atoms are being created continuously.


I am afraid that other processes will return ENOSPC, whereas there is
a lot of free disk space.
Assume fstrim grabbed all possible space. A process X , who needs to
reserve space invokes txnmgr_force_commit_all(). Everyone waits for
commits completion. After this fstrim grabs all possible space again
(there is no any queue for free space reclaimers). Process X returns
ENOSPC.

Edward.
