From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: insserv on Debian triggers "kernel BUG at fs/reiser4/plugin/object.c:58"
Date: Mon, 19 Nov 2012 21:06:38 +0100
Message-ID: <50AA914E.6020303@gmail.com>
References: <20121107194935.4e27acea@Ulf.tvoe.tv> <20121119231557.69d2488d@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=cNVKYRIPtTqNoIQgw6lzVRPcYX/OR/xfahbyXF0lxlU=;
        b=o8TBwbvccU6bgPQUb7OCb66T6e3zSZ3anWrfnyhj//rzf/ctbGFaOivNkpSsiz9EvM
         nuMJQvtWec3eApmAgtSISpVJxhIay5Jdp7RURtsMHCznFvEmtFOWEqPuaNV193UZ+Jyo
         lTEYVxOf3lSzISQ91SBN1Jo/Ac4k2y8Yrd30t5/ZpLq7m8Eja+dXl30fVSjJW0KXofIG
         5i70Fy5qca+7IX6ltRbTH9nYWdfea9JJrOiEru3Y81Ijp9HK6Jq2KnswD2ftQvKLAksR
         jGX3WPKdxbj72bacgfESKH7KVQXHL053n21lCap8rQvG/7p+29aBYoVCzqc4NOe9yd1S
         Nnvg==
In-Reply-To: <20121119231557.69d2488d@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>
Cc: dimas <dimas000@ya.ru>

On 11/19/2012 08:15 PM, dimas wrote:
> any news about this? do i need to provide some more info?

Hello.

Everything is more, or less clear with this BUG at object.c:58:
for every directory reiser4 installs aops with stubs, which cause oops.
Nobody remembers the purpose of these stubs. I think we'll just get rid
of them in the next release..

The more unpleasant issue is that the corruption is not gone: I have
reproduced this again for both plugins (w/ and w/o compression).
So will continue to narrow down...

Thanks,
Edward.
