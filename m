From: Mikko Rapeli <mikko.rapeli@iki.fi>
Subject: Re: [PATCH v06 05/36] uapi linux/sysctl.h: use __kernel_size_t
 instead of size_t
Date: Wed, 9 Aug 2017 10:18:04 +0300
Message-ID: <20170809071804.GD31101@lakka.kapsi.fi>
References: <20170808231711.GJ10552@altlinux.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi; s=20161220;
        h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date; bh=5hgsDq4bWPTeldjZHawPABvXnpiH5KevoQFeSflVOTQ=;
        b=0TxXSHH8qVcfDUJ9MuwNyLsK66pvniNjIo4y7YFt0SsHkweUxIArPytPIaRMv68t6lMYbeqaijfuVpbPGNmUUP+nu7bPM6Ard/ev0nwtspvQu+PuAlmOq9xq6LQ5Jj8VFVmUjNbUNFho/j8kIH14OFZ/AL4wvRMZm5MYRGK/WIDuOFhhAfuQzOSb7oyKiezvlZyx2y4tVIcQb6HQpczs1GkduTPqeV02otOeUiQERjQdzsaHCbnkcxOOogmP2Qg8IZgRzCysy7R4yLFVxwTf/FCTCpXLZXBvmKOWSEX22eGH5vUpqudJjrwQXxWJcXIW0R0oOrCuMjGIwXQiA112Bg==;
Content-Disposition: inline
In-Reply-To: <20170808231711.GJ10552@altlinux.org>
 <20170808231543.GI10552@altlinux.org>
 <20170808225739.GF10552@altlinux.org>
 <20170808225417.GE10552@altlinux.org>
 <20170808225026.GD10552@altlinux.org>
 <20170808224555.GC10552@altlinux.org>
 <20170808224253.GB10552@altlinux.org>
 <20170808223420.GA10552@altlinux.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Dmitry V. Levin" <ldv@altlinux.org>, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, "H . Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, reiserfs-devel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Matthew Whitehead <tedheadster@gmail.com>, Joel Scherpelz <jscherpelz@google.com>, Lorenzo Colitti <lorenzo@google.com>, "H . J . Lu" <hjl.tools@gmail.com>, linux-arch@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, kexec@lists.infradead.org, Eric Biederman <ebiederm@xmission.com>

Hi Dmitry and thanks for the comments.

I have only one question: why haven't your patches been applied yet?

-Mikko
