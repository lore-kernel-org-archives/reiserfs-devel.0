From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Overriding with node41 doesn't work.
Date: Tue, 05 Jan 2016 22:45:27 +0100
Message-ID: <568C3977.5010606@gmail.com>
References: <n6gg6h$7u6$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=HALO+PKp1ioHmfJDPjRejYCZ05TIRdutCOHQnRoQZBs=;
        b=PTAuOWaAABWV7bG3g6CB9JZGBM7JfVv1MxXawNZNLZ9CDcMK5NZTk/Vhzmk35Q4Gwn
         1CoyIHmmXvFguZxxikyaW6mC6dktMgbAGMrLpPNSXPxBtjhvPkP4CZABCI/3WnZYFwkF
         +pjGm4/DO2GuI4HFcc6zEJoP/H6nP2RLlFXXMWhjFMljFZ+KDsukKKZ5W7DS6FpT6iKa
         AgB8VpFNSO7/EUiJ5AmSNPBDD5XoUc1tISP/Wl/HC/4DuoUxTZe+Bk0RnIehqY2oEGnT
         6dtaTZrkJpVCuSvjOep/KuElt1WTCmRehdHVY7Pq40dpKC+3njVw8ps9HU9WMSEp1a0t
         +kzQ==
In-Reply-To: <n6gg6h$7u6$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Georgios Tsalikis <georgios@tsalikis.net>, reiserfs-devel@vger.kernel.org



On 01/05/2016 02:18 PM, Georgios Tsalikis wrote:
> Or at least so it seems. Once i used node=node41 for checksums but the 
> system showed node40.


Who exactly reports "node40"?


> Now i did an fsck with override node=node41 trying to add the feature 
> in a partition with node40. It reports node40 afterwards. Any clues?


You can specify node=node41 only when formatting a partition.
Different node formats in the same reiser4 volume are not supported.
Conversion of node formats are not implemented. To check the actual
node format, dump the tree with "debugfs.reiser4 -f -t /dev/xxx" and
grep for "NODE". If your nodes are managed by node41 plugin, then
you'll see the field "CSUM=xxxxx".

Thanks,
Edward.
