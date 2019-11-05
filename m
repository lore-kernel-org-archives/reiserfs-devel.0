From: Mark Salyzyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Subject: Re: [PATCH v15 1/4] Add flags option to get xattr method
 paired to __vfs_getxattr
Date: Tue, 5 Nov 2019 07:37:04 -0800
Message-ID: <1de43656-e751-53a2-c0da-ff44ecbabbc4@android.com>
References: <20191104215253.141818-1-salyzyn@android.com>
 <20191104215253.141818-2-salyzyn@android.com>
 <20191105094830.GL22379@quack2.suse.cz>
Reply-To: Mark Salyzyn <salyzyn@android.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2eE38FGpCOgBEuWocFCXrf19QHBihOvJgkOlA+aavw=; b=Tq7lLivit8ZFmYBWu5ijl4GlMH
	tLY8YnYUwgvmTKE5Ts9Cz/hNvOT0ILr/FdpHAxwKczyhVSIaiJepBCoIfGt+q45xxMvM7qhnkgz8h
	pmpRZ08kvsZOrSi1zg0bc7C+6WuohJ5OL+FW463a9R343RyRIEZ/3PelAmjkmiAYnzyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2/8/BwrhtmEXI7dj68SMTpCzdsjoLETsRSfZ5j8yePw=; b=AFXGvqGMbX+60v6PtR/E8Q1kQl
 SGrkYXIc35qJIgDT/JdbmeHnB8QBZWddUhq61LNa3O7HL9NAMzndmKrMLC1JJNndh4aMrbHKPFYEj
 rhQ7Tf6lXZFZj5nZ5APZqJ6rMFg6QuSXxU6zkzfe1FWvXtvj7ygxrSOx8AEeaizy1RIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2/8/BwrhtmEXI7dj68SMTpCzdsjoLETsRSfZ5j8yePw=; b=AMZVbporIAuKi6zkr59FI01o6+
 I/pYqHWgLzcChKcX4E8f1zwl8IFC0CSMlMwsDwxou68QyYGQgG67hT2Gznsbmiu7DLNVzQTm1uKJD
 FeC9LPuwkQrqrq3WwkxRgiFeiRx12eaZ+bDfCVwcBBZA4pL3ZWNnzASyN9CF8k9OMLuo=;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=2/8/BwrhtmEXI7dj68SMTpCzdsjoLETsRSfZ5j8yePw=;
 b=R8lPpHZaNTKC1//4X3YRy/co01wfSuPnFkkkoDrdRRcs8xZqXtNYPLgm9OjzsXnJfg
 w/sgCdd9n+99HdKAd13HjrpckBRQK4F+I41/fuJw7ICMDJgQ0tKfn8kAw++u9jIK9Pl7
 wc3lGWI+tLAg5Fo7mlf+u1oz4ZCnt5dRpAwNiKM1EwVqGR4FwH3zMLPET/FX6DvXl/Cq
 XMn8MNwm1G21DoBMHo9twX6ox9SH+JhzmjDChdy5f2tzhmNnEaRv4FiGKkmYlD/OTP+l
 39M21mPDgGHAV1JVejM/uCulS4TGW/MwgQAeZfS0L3/q73lP5U74GqdSjn6t5WS3czii
 QV3g==
In-Reply-To: <20191105094830.GL22379@quack2.suse.cz>
Content-Language: en-GB
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Kara <jack@suse.cz>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net, linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org, Dominique Martinet <asmadeus@codewreck.org>, Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>, "David S. Miller" <davem@davemloft.net>, Andreas Dilger <adilger.kernel@dilger.ca>, Eric Paris <eparis@parisplace.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, netdev@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org, linux-unionfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.c>

On 11/5/19 1:48 AM, Jan Kara wrote:
>> @@ -228,11 +228,11 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
>>   		break;
>>   	case 1:
>>   		data = buf;
>> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
>> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
>>   		break;
>>   	case 2:
>>   		data = buf;
>> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
>> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
>>   		break;
>>   	case 3:
> These scnprintf() changes (and there are more in the patch) probably
> shouldn't be here... Otherwise the patch still looks good to me :).
>
> 								Honza
>
Good catch, they were done in locality, I forgot about them, this patch 
series has been living for almost a year now and time has become its 
enemy ... will spin this as a separate patch. They strike as a security 
issue with the possibility of fragile UAF when the code is maintained by 
future selves.

-- Mark
