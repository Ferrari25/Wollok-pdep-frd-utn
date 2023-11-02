class Planta {
    const anio_obtencion
    const property altura

    method cuantoSolTolera()
    method esFuerte() = self.cuantoSolTolera() > 10
    method daSemillas() = self.esFuerte() || self.condicionAlternativa()
    method espacioQueOcupa()
    method condicionAlternativa()
    method esIdeal(parcela)
}

class Menta inherits Planta {
    override method cuantoSolTolera() = 6
    override method condicionAlternativa() = altura > 0.4
    override method espacioQueOcupa() = altura * 3
    override method esIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Planta {
    override method cuantoSolTolera() {
        if (altura < 0.5) {
            return 6
        } else if (altura <= 1) {
            return 7 
        } else {
            return 9
        }
    }

    override method condicionAlternativa() = anio_obtencion > 2007
    override method espacioQueOcupa() = altura / 2
    override method esIdeal(parcela) = parcela.hsDeSol() == self.cuantoSolTolera()
}

class Quinoa inherits Planta {
    const cuantoSolTolera
    override method cuantoSolTolera() = cuantoSolTolera
    override method espacioQueOcupa() = 0.5
    override method condicionAlternativa() = anio_obtencion > 2005
    override method esIdeal(parcela) = parcela.plantas().all({p=>p.altura() <= 1.5})
}

class SojaTransgenica inherits Soja {
    override method daSemillas() = false
    override method esIdeal(parcela) = parcela.cantMaximaPlantas() == 1
}

class Hierbabuena inherits Menta {
    override method espacioQueOcupa() = super().espacioQueOcupa() * 2
}