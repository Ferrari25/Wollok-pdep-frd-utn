class Parcela {
    const ancho = 0
    const largo = 0
    var property hsDeSol = 0
    var property plantas = []

    method superficie() = ancho*largo
    method cantMaximaPlantas() {
        if (ancho > largo) {
            return self.superficie() / 5
        } else {
            return self.superficie() / 3 + largo
        }
    }
    method tieneComplicaciones() = plantas.any({p => p.cuantoSolTolera() < hsDeSol})
    method plantar(planta) {
        if (plantas.size() + 1 > self.cantMaximaPlantas() || planta.cuantoSolTolera() + 2 <= hsDeSol) {
            throw new Exception(message="No se puede agregar la planta a la parcela")
        } else {
            plantas.add(planta)
        }
    }
}

class ParcelaEcologica inherits Parcela {
    method seAsociaBien(planta) = !(self.tieneComplicaciones()) && planta.esIdeal(self)
}

class ParcelaIndustrial inherits Parcela {
    method seAsociaBien(planta) = self.plantas().size() <= 2 && planta.esFuerte()
}

object inta {
    const parcelas = []

    method promedioDePlantas() {
        const cantPlantasPorParcela = parcelas.sum({p=>p.plantas().size()})
        return cantPlantasPorParcela / parcelas.size()
    }

    method masAutosustentable() {
        return parcelas.filter({parcela => 
            parcela.plantas().size() > 4 
        }).max({parcela => 
            parcela.plantas().count({p=>parcela.seAsociaBien(p)}) / parcela.plantas().size()
        })
    }
}
