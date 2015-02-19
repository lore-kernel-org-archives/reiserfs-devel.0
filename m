From: <doiggl@velocitynet.com.au>
Subject: Re: help wanted add-node41.patch fails to apply to reiser4progs version 1.0.9
Date: Fri, 20 Feb 2015 01:01:50 +1100
Message-ID: <cb14e1389131b5cb6ed38b89ed0bf005@mail.velocitynet.com.au>
References: <a6ad8c02cd6dcddc95b2d7e25d42f35c@mail.velocitynet.com.au> <CAM12Q5R3HCPNjL+wnX6wqXfbCM9F1n_cLLD2rGQcGLgM8Soxew@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAM12Q5R3HCPNjL+wnX6wqXfbCM9F1n_cLLD2rGQcGLgM8Soxew@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jose R R <Jose.r.r@metztli-it.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>


> Steps were:
> 
> autoreconf
> ./configure
> make
> make install
> 
> http://marc.info/?l=reiserfs-devel&m=142426774807698&w=2
> 
> thus, likely you overlooked the first directive -- as Ed suggested:
> 
> "try autoreconf before ./configure"
> 
> http://marc.info/?l=reiserfs-devel&m=142419259318629&w=2
> 
> 
> Best Professional Regards.

Hello,
Interestingly the spec file needs to have in it somewhere to allow it to
run: 

autoreconf

This needs a BuildRequires: <packagename> to enable the command
'autoreconf' to run.
--Glenn

I got this in the spec file so far:

Patch0: add-node41.patch
.
.

%prep
%setup -q
%patch0 -p1
.
.

%build
#
# Disabling hashes only affects minimal library. The options are
# a recommendation from reiser4progs's shipped .spec file.
#
%configure --disable-static --enable-libminimal --disable-fnv1-hash \
	--disable-rupasov-hash --disable-tea-hash --disable-deg-hash
make %{?_smp_mflags}


-The full [long] log is at:
https://build.opensuse.org/build/home:doiggl/openSUSE_13.1/x86_64/reiser4progs/_log

- spec file is at:
https://build.opensuse.org/package/view_file/home:doiggl/reiser4progs/reiser4progs.spec?expand=1

- project: 
https://build.opensuse.org/package/show/home:doiggl/reiser4progs

