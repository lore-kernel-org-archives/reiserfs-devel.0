From: "=?ISO-8859-2?Q?Grzegorz_Ja=B6kiewicz?=" <gryzman@gmail.com>
Subject: Re: Why reiser does a disk write on every sync() call?
Date: Sat, 12 May 2007 14:03:44 +0100
Message-ID: <2f4958ff0705120603x4da5bcdq2c48c9394586f6c@mail.gmail.com>
References: <08A9A3213527A6428774900A80DBD8D803BB80B4@xmb-sjc-222.amer.cisco.com>
	 <200703272254.46500.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30645-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=PfQgIO6CfOUvWuOMM+ErWkkbVX5dPXjyBd3fDQnhb0MjDqEp+qpVCO+zhw21eM6xP/NWq+y9kJowQ+dcGlcDoufiSFD9xD+nI5O/g53ALTAr5xF720/FmLmPLWzLPLpPH77t+w/KYwJVO1mp/dftcifpesAp5qR7MMadZxr+WsE=
In-Reply-To: <200703272254.46500.vs@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

sounds like useless waste of time and space
You haven't stated the reason, why it has to create and commit empty
transaction.

-- 
GJ
