require 'spine/transform'

module Spine
  module Transform
    describe Transformer do
      context 'when transforming flat hash' do
        let(:target) {
          { customer_name: 'Elmo', vat_code: 'EEE12345' }
        }

        it 'copies defined attributes to destination' do
          subject = Transformer.define do
            copy :customer_name
          end

          result = subject.transform(target)
          expect(result[:customer_name]).to eq(target[:customer_name])
        end

        it 'copies defined attributes to target destination' do
          subject = Transformer.define do
            copy :customer_name, to: :name
          end

          result = subject.transform(target)
          expect(result[:name]).to eq(target[:customer_name])
        end

        it 'rejects undefined attributes' do
          subject = Transformer.define do
            copy :customer_name
          end

          result = subject.transform(target)
          expect(result[:customer_name]).to be
          expect(result[:vat_code]).not_to be
        end
      end

      context 'when transforming nested hash' do
        let(:target) {
          {
            customer_name: 'Elmo',
            vat_code: 'EEE12345',
            postal_address: address
          }
        }
        let(:address) {
          { address: 'Seesame Street', country: 'United States' }
        }

        it 'flattens to destination' do
          subject = Transformer.define do
            transform :postal_address, flatten: true do
              copy :country
            end
          end

          result = subject.transform(target)
          expect(result[:country]).to eq(target[:postal_address][:country])
        end

        it 'copies defined attributes to destination' do
          subject = Transformer.define do
            transform :postal_address do
              copy :country
            end
          end

          result = subject.transform(target)
          expect(result[:postal_address][:country])
            .to eq(target[:postal_address][:country])
        end

        it 'copies defined attributes to target destination' do
          subject = Transformer.define do
            transform :postal_address, to: :address do
              copy :address, to: :street
            end
          end

          result = subject.transform(target)
          expect(result[:address][:street]).to eq(target[:postal_address][:address])
        end

        it 'rejects undefined attributes' do
          subject = Transformer.define do
            transform :postal_address do
              copy :address
            end
          end

          result = subject.transform(target)
          expect(result[:postal_address][:address]).to be
          expect(result[:postal_address][:country]).not_to be
        end
      end

      context 'when parsing values when transforming' do
        it 'transforms value to integer' do
          subject = Transformer.define do
            integer :identity
          end

          result = subject.transform(identity: '1')
          expect(result[:identity]).to eql(1)
        end

        it 'transforms value to decimal' do
          subject = Transformer.define do
            decimal :price
          end

          result = subject.transform(price: '1.25')
          expect(result[:price]).to eql(1.25)
        end

        it 'transforms value to boolean' do
          subject = Transformer.define do
            boolean :active
          end

          result = subject.transform(active: nil)
          expect(result[:active]).to eql(false)
        end

        it 'transforms value to boolean from integer' do
          subject = Transformer.define do
            boolean :active
          end

          expect(subject.transform(active: 0)[:active]).to eql(false)
          expect(subject.transform(active: 1)[:active]).to eql(true)
        end

        it 'transforms value to boolean from string' do
          subject = Transformer.define do
            boolean :active
          end

          expect(subject.transform(active: 'f')[:active]).to eql(false)
          expect(subject.transform(active: 't')[:active]).to eql(true)

          expect(subject.transform(active: 'false')[:active]).to eql(false)
          expect(subject.transform(active: 'true')[:active]).to eql(true)

          expect(subject.transform(active: '0')[:active]).to eql(false)
          expect(subject.transform(active: '1')[:active]).to eql(true)
        end

        it 'transforms value to date' do
          subject = Transformer.define do
            date :starts_at
          end

          date = Date.new(2014, 1, 1)
          result = subject.transform(starts_at: date.iso8601)
          expect(result[:starts_at]).to eql(date)
        end

        it 'transforms value to timestamp' do
          subject = Transformer.define do
            timestamp :starts_at
          end

          date = DateTime.new(2014, 1, 1, 12, 0, 0)
          result = subject.transform(starts_at: date.iso8601)
          expect(result[:starts_at]).to eql(date)
        end
      end
    end
  end
end
