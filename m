From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Sat, 02 Aug 2014 18:40:57 +0200
Message-ID: <53DD1499.5040601@gmail.com>
References: <3405506.BC0S4TX54B@intelfx-laptop> <53DABD4E.1000905@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=0OOSr+vRbJl4W6uObaEtRIrEgqvlvWU+nwTpS8FcnPA=;
        b=YmNwnIT7W3YazQs+1AKnn8CqKwWI0Tj49Jc/lbcEaLdBX9wbH64Zjb0f+uyy+jU2Iq
         yGKVODar29U711iY5Rlp9in9j2rGw0YpXTcLRbqzP6G9hTk3sGRZZ4R7QwmEyz4bAdf/
         VuX+ouCs70dEDPU3Rudw4kVM9uzd1T9Nk0rEEAY+undLjGSGxuCMsHEyM7qhKoA8PuH2
         aI9mpJBD43fAK4dYmi6AAyk6fXJAE7csa1MIlUkeCfbEpu9xJqEFid1Kyr9w2zuKNFHM
         lmtN6mRsI4FFq5ZIfUkzdJEThdTGehpqGEDW+a9eBktR94qX4D4WmPC8dsT3S9Csd+Cn
         5aTQ==
In-Reply-To: <53DABD4E.1000905@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 08/01/2014 12:03 AM, Edward Shishkin wrote:
> grab_space() is only for processes which require disk space (including
> wandered blocks). For example ->read() modifies a superblock (atime),


^superblock^ stat_data (on-disk inode)


> which should be written via journal. So ->read() grab 1 block, etc.
>

