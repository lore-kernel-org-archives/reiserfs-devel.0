From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Tue, 30 Jun 2015 01:54:28 +0800
Message-ID: <55918654.80703@gmail.com>
References: <558D5C72.2040203@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=lSXlWiiLDgKGgiJFnFT5T9DjTrFR4WS4gFYpVudWL1g=;
        b=mnFTSW15RE5TNQC67M0W4i0dYbnGHOwzXY+4IgQwd9rjX8Uic8ERMtyRI0PAOM7r1l
         dBg+ApFPwG/7gwfxxZPDOclre+HX+h61P6GAdP73cYRVm7jFx65tZGPhH8fdrHZgfaOX
         ucvDCk4OLLKULeRbMBmXSMEBk61t5wmMdLPSdcPj5ZHcvNa4EqAnmLiNl8ufRmnZ5C0r
         6R9Cb26ZqddAGUtlrUdLe3N7W7uKOG7gx4507Cf2VjWHmgUASevNAErVGUe7CcMO/hbf
         TmkYK8ZhrUIDRzqgjCazMo+5flsMDGc3cwykWbN8iV0Wgthp/uHHcaBZxL8Ptp49CFnB
         W1xg==
In-Reply-To: <558D5C72.2040203@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Oh, bad
generic_write_checks() doesn't change offset now,
please, ignore this patch..

Thanks,
Edward.
