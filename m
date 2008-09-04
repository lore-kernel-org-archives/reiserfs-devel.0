From: "=?UTF-8?Q?Br=C3=A1ulio_Barros_de_Oliveira?=" <brauliobo@gmail.com>
Subject: reiserfs do_journal_end unnecessary hd wake up?
Date: Wed, 3 Sep 2008 23:56:03 -0300
Message-ID: <1df1788c0809031956r2dad6a58l4be82d370b09f870@mail.gmail.com>
References: <1df1788c0809031953p22bbbb2cy6dd0d8bbb8339872@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=sxZ9IMdETjDRgAb36x4J1a2Hb0Z8mM1ZgZMYhCHbW1Y=;
        b=lqHNIwcztHeWhsN/YtY8IUUejR6NPlg52auHqHWzgBAfML1IZc4ItrCZRbKBtCBRD0
         c8moCrE+h9kMGz5C0cqXt9WEHWbUwAGdS5wueArm6w91si3Nc4cNlznU+s37qnpOLzpL
         0c0ERTNPJxWuyQTq3f/7CwgFl8ZkpQUlFB1so=
In-Reply-To: <1df1788c0809031953p22bbbb2cy6dd0d8bbb8339872@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1254"
To: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

aGVsbG8sCgp0aGlzIGlzIG15IHZlcnkgZmlyc3QgcG9zdCBoZXJlLiBwbGVhc2UgY29ycmVjdCBt
ZSBpZiBuZWNlc3NhcnkuCgppJ20gcHJldHR5IHBhcmFub2ljIHdpdGggZW5lcmd5IHNhdmUgd2l0
aCBteSBsYXB0b3AuIGEgZ29vZCB3YXkgdG8Kc2F2ZSBpdCwgaXMgdG8gZW5hYmxlIEFQTSBmb3Ig
dGhlIEhELgp0aGF0J3Mgd2hlcmUgSSBzZWUgbWF5YmUgcmVpc2VyZnMgaXMgZG9pbmcgc29tZXRo
aW5nIHdyb25nLiBldmVuCmtpbGxpbmcgYWxtb3N0IGV2ZXJ5IHByb2Nlc3MgYW5kIG5vdCBydW5u
aW5nIFgsIGRvX2pvdXJuYWxfZW5kIGtlZXBzCmFwcGVhcmluZyBvbiBwb3dlcnRvcCBhbmQgdGhl
IGhhcmQgZGlzayBrZWVwcyB3YWtpbmcgdXAgYW5kIHNsZWVwaW5nLApzb21ldGhpbmcgeW91IGNh
biBub3RpY2UgYnkgdGhlIG5vaXN5IGNsaWNrcy4KCmlzIHRoaXMgYmVoYXZpb3VyIHJlYWxseSBy
aWdodD8KaXMgdGhlcmUgYW55IHdheSB0byBhdm9pZCB0aGVzZSB3YWtldXAgKGFsbW9zdCAyd2F0
dHMgcG93ZXJzYXZlKT8KCnN5c3RlbTogYXJjaGxpbnV4IHdpdGgga2VybmVsIDIuNi4yNi4zIGFu
ZCBzdGFuZGFyZCByZWlzZXJmcyAzLjYgZnMuCgp0aGFua3ggaW4gYWR2YW5jZSwKYnLDoXVsaW8K
