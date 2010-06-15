From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: [PATCH 4/8]drivers:tmp.c Fix warning: variable 'rc' set but	not
	used
Date: Mon, 14 Jun 2010 22:58:55 -0700
Message-ID: <4C17169F.4060205@gmail.com>
References: <1276547208-26569-1-git-send-email-justinmattock@gmail.com>
	<1276547208-26569-5-git-send-email-justinmattock@gmail.com>
	<21331.1276560832@localhost> <4C16E18F.9050901@gmail.com>
	<9275.1276573789@localhost> <4C16F9FC.2080905@gmail.com>
	<20100615052944.7746.qmail@stuge.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=R+tnbHRqAouMpulkjWokZDW/VyOPMzg0D+cmWLG/mxY=;
	b=xGBS+L1Ln9ISAqhmMEemLNs5ph9lqD8oAnJ75et4LsqkKYL+9w+bciZ1421khQn6cS
	Uizw/gIHL5LCj1iQrVzOfdxHivoJZFZY8JDAIWbB7mI+6MbvMarFQlU1TLWLlD2yFU5B
	y/yF1vvZBHGh0cQoarBD/c7RD3Aycz4r75zrQ=
In-Reply-To: <20100615052944.7746.qmail@stuge.se>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, reiserfs-devel@vger.kernel.org, linux-bluetooth@vger.kernel.org, debora@linux.vnet.ibm.com

On 06/14/2010 10:29 PM, Peter Stuge wrote:
> Justin P. Mattock wrote:
>>> *baffled* Why did you think that would work? transmit_cmd()s signature
>>> has 4 parameters.
>>
>> I have no manual in front of me. Did a quick google, but came up with
>> (no hits) info on what that function does. grep showed too many entries
>> to really see why/what this is.
>
> Check out the tool cscope. (Or kscope, if you prefer a GUI.)
>
>
> //Peter
>

thanks for this tool.. I think this is what I need.. running around not 
knowing what/where the manual is for a call is a bit daunting.
I'll give this a look.

Thanks for this..

Justin P. Mattock
